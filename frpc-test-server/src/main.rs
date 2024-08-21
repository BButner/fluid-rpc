use std::{net::ToSocketAddrs, pin::Pin, time::Duration};

use chrono::{DateTime, Local};
use foo::{FooRequest, FooResponse, FooStreamIntervalRequest, FooStreamRequest, FooStreamResponse};
use tokio::sync::mpsc;
use tokio_stream::{wrappers::ReceiverStream, Stream, StreamExt};
use tonic::{transport::Server, Request, Response, Status};

use self::foo::foo_service_server::FooService;

pub mod foo {
    tonic::include_proto!("com.bbutner.frpc.testserver");

    pub(crate) const FILE_DESCRIPTOR_SET: &[u8] = tonic::include_file_descriptor_set!("testserver");
}

struct FooServer {}

type ResponseStream = Pin<Box<dyn Stream<Item = Result<FooStreamResponse, Status>> + Send>>;
type FooResponseWrapper<T> = Result<Response<T>, Status>;

#[tonic::async_trait]
impl FooService for FooServer {
    type GetIntervalStreamStream = ResponseStream;
    type GetStreamStream = ResponseStream;

    async fn say_hello(
        &self,
        request: Request<FooRequest>,
    ) -> FooResponseWrapper<foo::FooResponse> {
        Ok(Response::new(foo::FooResponse {
            message: format!("Hello, {}!", request.into_inner().name),
        }))
    }

    async fn get_interval_stream(
        &self,
        request: Request<FooStreamIntervalRequest>,
    ) -> FooResponseWrapper<Self::GetIntervalStreamStream> {
        let repeat = std::iter::repeat(FooStreamResponse {
            result: Local::now().to_rfc3339(),
        });
        let mut stream = Box::pin(tokio_stream::iter(repeat).throttle(Duration::from_millis(
            request.into_inner().delay_milliseconds,
        )));

        let (tx, rx) = mpsc::channel(128);
        tokio::spawn(async move {
            while let Some(item) = stream.next().await {
                match tx.send(Result::<_, Status>::Ok(item)).await {
                    Ok(_) => {}
                    Err(_item) => {
                        break;
                    }
                }
            }
        });

        let output_stream = ReceiverStream::new(rx);
        Ok(Response::new(
            Box::pin(output_stream) as Self::GetIntervalStreamStream
        ))
    }

    async fn get_stream(
        &self,
        _request: Request<FooStreamRequest>,
    ) -> FooResponseWrapper<Self::GetIntervalStreamStream> {
        let repeat = std::iter::repeat(FooStreamResponse {
            result: Local::now().to_rfc3339(),
        });
        let mut stream = Box::pin(tokio_stream::iter(repeat).throttle(Duration::from_millis(200)));

        let (tx, rx) = mpsc::channel(128);
        tokio::spawn(async move {
            while let Some(item) = stream.next().await {
                match tx.send(Result::<_, Status>::Ok(item)).await {
                    Ok(_) => {}
                    Err(_item) => {
                        break;
                    }
                }
            }
        });

        let output_stream = ReceiverStream::new(rx);
        Ok(Response::new(
            Box::pin(output_stream) as Self::GetIntervalStreamStream
        ))
    }
}

#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    let server = FooServer {};
    let reflection_service = tonic_reflection::server::Builder::configure()
        .register_encoded_file_descriptor_set(foo::FILE_DESCRIPTOR_SET)
        .build()
        .unwrap();

    Server::builder()
        .add_service(reflection_service)
        .add_service(foo::foo_service_server::FooServiceServer::new(server))
        .serve("[::1]:50051".to_socket_addrs().unwrap().next().unwrap())
        .await
        .unwrap();

    Ok(())
}
