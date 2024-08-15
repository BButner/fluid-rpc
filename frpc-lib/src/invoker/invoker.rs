use std::str::FromStr;

use anyhow::{bail, Result};
use chrono::Local;
use futures::channel::mpsc::UnboundedSender;
use prost_reflect::{DescriptorPool, DynamicMessage, ReflectMessage};
use regex::Regex;
use serde_json::Deserializer;
use tokio_stream::StreamExt;
use tonic::codegen::http::uri::PathAndQuery;
use tonic::{client::Grpc, transport::Channel, Request};
use tonic::{Response, Status};

use crate::misc::error_helper::send_invoker_error;
use crate::stream::fluid_message_received::FluidMessageReceived;
use crate::stream::fluid_stream_event::FluidStreamEvent;
use crate::{
    invoker::invoker_error::InvokerError,
    loader::{file_loader::load_from_files, reflection_loader::load_from_server_reflection},
};

use super::dynamic_message_codec::DynamicMessageCodec;

pub async fn invoke(
    mut tx: UnboundedSender<FluidStreamEvent>,
    server_url: String,
    target_method: String,
    data: Option<String>,
    file_paths: Option<Vec<String>>,
    include_paths: Option<Vec<String>>,
) -> Result<()> {
    if (file_paths.is_some() && include_paths.is_none())
        || (file_paths.is_none() && include_paths.is_some())
    {
        bail!(send_invoker_error(
            &mut tx,
            InvokerError::InvalidArguments(String::from(
                "Must supply Proto File Paths and Include File Paths to load protos from files.",
            ))
        ));
    }

    let pool = match if file_paths.is_some() && include_paths.is_some() {
        load_from_files(file_paths.unwrap(), include_paths.unwrap())
    } else {
        load_from_server_reflection(server_url.clone()).await
    } {
        Ok(p) => p,
        Err(e) => bail!(send_invoker_error(
            &mut tx,
            InvokerError::DescriptorPoolLoadFailed(e.to_string())
        )),
    };

    invoke_with_pool(tx, pool, server_url, target_method, data).await
}

pub async fn invoke_with_pool(
    mut tx: UnboundedSender<FluidStreamEvent>,
    pool: DescriptorPool,
    server_url: String,
    target_method: String,
    data: Option<String>,
) -> Result<()> {
    let re = Regex::new(r"^(\/)?(?<servicePath>\w+(\.\w+)+)\/(?<methodName>\w+)$").unwrap();
    let caps = re.captures(&target_method);

    let service_path;
    let method_name;

    match caps {
        Some(cap) => {
            service_path = match cap.name("servicePath") {
                Some(val) => val.as_str().to_string(),
                None => bail!(send_invoker_error(
                    &mut tx,
                    InvokerError::InvalidTargetMethod(target_method)
                )),
            };
            method_name = match cap.name("methodName") {
                Some(val) => val.as_str().to_string(),
                None => bail!(send_invoker_error(
                    &mut tx,
                    InvokerError::InvalidTargetMethod(target_method)
                )),
            }
        }
        None => bail!(send_invoker_error(
            &mut tx,
            InvokerError::InvalidTargetMethod(target_method)
        )),
    }

    let service = match pool.get_service_by_name(&service_path) {
        Some(s) => s,
        None => bail!(send_invoker_error(
            &mut tx,
            InvokerError::ServiceNotFound(service_path)
        )),
    };

    let method = match service.methods().find(|m| m.name().eq(&method_name)) {
        Some(m) => m,
        None => bail!(send_invoker_error(
            &mut tx,
            InvokerError::MethodNotFound(method_name)
        )),
    };

    tx.unbounded_send(FluidStreamEvent::InitiatingConnection(Local::now()))?;

    let endpoint = match Channel::from_shared(server_url.clone()) {
        Ok(c) => c,
        Err(e) => bail!(send_invoker_error(
            &mut tx,
            InvokerError::CreateConnectionFailed(e.to_string())
        )),
    };

    let channel = match endpoint.connect().await {
        Ok(c) => c,
        Err(e) => bail!(send_invoker_error(
            &mut tx,
            InvokerError::CreateConnectionFailed(e.to_string())
        )),
    };

    let mut client = Grpc::new(channel);

    client.ready().await?;

    tx.unbounded_send(FluidStreamEvent::Connected(Local::now()))?;

    let data = &data.unwrap_or(String::from("{}"));

    let mut deserializer = Deserializer::from_str(data);
    let message = match DynamicMessage::deserialize(method.clone().input(), &mut deserializer) {
        Ok(message) => message,
        Err(e) => bail!(send_invoker_error(
            &mut tx,
            InvokerError::DynamicMessageDecodingFailed(e.to_string())
        )),
    };
    deserializer.end().unwrap();

    let request = Request::new(message.clone());
    let path = PathAndQuery::from_str(&format!("/{}/{}", &service_path, &method_name)).unwrap();

    let mut deserializer = Deserializer::from_str(data);
    let output_message =
        DynamicMessage::deserialize(method.clone().output(), &mut deserializer).unwrap();
    deserializer.end().unwrap();

    match method.clone().is_server_streaming() {
        true => {
            let stream = client
                .server_streaming(
                    request,
                    path,
                    DynamicMessageCodec::new(output_message.descriptor()),
                )
                .await;

            let mut streaming = stream.unwrap().into_inner();

            while let Some(result) = streaming.next().await {
                match result {
                    Ok(message) => {
                        // if has_output {
                        //     let line_count = pretty.clone().split('\n').count();

                        //     for _ in 0..line_count {
                        //         print!("\r\x1B[K\r\x1B[A");
                        //     }
                        //     print!("\r\x1B[K");
                        // }
                        // has_output = true;
                        // println!("{}", pretty);
                        let _ = tx.unbounded_send(FluidStreamEvent::StreamingMessageReceived(
                            FluidMessageReceived::new(message),
                        ));
                    }
                    Err(e) => bail!(send_invoker_error(
                        &mut tx,
                        InvokerError::StreamingError(e.to_string())
                    )),
                };
            }
        }
        false => {
            let response: Result<Response<DynamicMessage>, Status> = client
                .unary(
                    request,
                    path,
                    DynamicMessageCodec::new(output_message.descriptor()),
                )
                .await;

            match response {
                Ok(response) => {
                    let _ = tx.unbounded_send(FluidStreamEvent::UnaryMessageReceived(
                        FluidMessageReceived::new(response.into_inner()),
                    ));
                }
                Err(e) => bail!(send_invoker_error(
                    &mut tx,
                    InvokerError::UnaryError(e.to_string())
                )),
            }
        }
    };

    Ok(())
}
