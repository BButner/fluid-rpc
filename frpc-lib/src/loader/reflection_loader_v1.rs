use std::collections::{HashMap, HashSet};

use anyhow::{bail, Result};
use prost::Message;
use prost_reflect::DescriptorPool;
use prost_types::FileDescriptorProto;
use tokio_stream::StreamExt;
use tonic::{
    transport::{Channel, Endpoint},
    Request,
};

use tonic_reflection::pb::v1::{
    server_reflection_client::ServerReflectionClient, server_reflection_request::MessageRequest,
    server_reflection_response::MessageResponse, FileDescriptorResponse, ServerReflectionRequest,
};

pub(crate) async fn load_from_server_reflection(server_url: String) -> Result<DescriptorPool> {
    let mut pool = DescriptorPool::new();

    let connection = get_client(server_url).await;

    match connection {
        Ok(client) => match populate_descriptor_pool(&mut pool, client).await {
            Ok(_) => Ok(pool),
            Err(e) => bail!("Error getting Server Reflections: {}", e),
        },
        Err(e) => bail!("Error creating gRPC connection: {}", e),
    }
}

pub(crate) async fn check_implemented(server_url: String) -> Result<bool> {
    let connection = get_client(server_url).await;

    match connection {
        Ok(mut client) => {
            let list_services_request = ServerReflectionRequest {
                host: String::new(),
                message_request: Some(MessageRequest::ListServices(String::new())),
            };

            let services_response = match client
                .server_reflection_info(Request::new(tokio_stream::once(list_services_request)))
                .await
            {
                Ok(resp) => resp,
                Err(e) => {
                    if e.code() == tonic::Code::Unimplemented {
                        return Ok(false);
                    } else {
                        bail!(e);
                    }
                }
            };

            if let Some(MessageResponse::ListServicesResponse(services)) = services_response
                .into_inner()
                .next()
                .await
                .expect("Response did not exist")
                .expect("Message did not exist")
                .message_response
            {
                Ok(true)
            } else {
                Ok(false)
            }
        }
        Err(e) => bail!("Error creating gRPC connection: {}", e),
    }
}

async fn get_client(server_url: String) -> Result<ServerReflectionClient<Channel>> {
    let connection = Endpoint::new(server_url);

    match connection {
        Ok(endpoint) => {
            let conn = endpoint.connect().await;

            match conn {
                Ok(channel) => Ok(ServerReflectionClient::new(channel)),
                Err(e) => {
                    dbg!(&e);
                    bail!(e)
                }
            }
        }
        Err(e) => {
            dbg!(&e);
            bail!(e)
        }
    }
}

async fn populate_descriptor_pool(
    pool: &mut DescriptorPool,
    mut client: ServerReflectionClient<Channel>,
) -> Result<()> {
    let list_services_request = ServerReflectionRequest {
        host: String::new(),
        message_request: Some(MessageRequest::ListServices(String::new())),
    };

    let services_response = match client
        .server_reflection_info(Request::new(tokio_stream::once(list_services_request)))
        .await
    {
        Ok(resp) => resp,
        Err(e) => bail!(e),
    };

    if let Some(MessageResponse::ListServicesResponse(services)) = services_response
        .into_inner()
        .next()
        .await
        .expect("Response did not exist")
        .expect("Message did not exist")
        .message_response
    {
        let service_file_paths = services.service.into_iter().map(|s| s.name).collect();

        let all_file_bytes = reflect_decode_files_bytes(&mut client, service_file_paths)
            .await
            .expect("Failed to get file bytes");

        let mut dependency_paths: HashSet<String> = HashSet::new();

        let mut decoded_depdendencies: HashMap<String, FileDescriptorProto> = HashMap::new();
        let mut decoded_files: HashMap<String, FileDescriptorProto> = HashMap::new();

        for bytes in all_file_bytes {
            let slice = bytes.as_slice();
            let file_desc = FileDescriptorProto::decode(slice);

            match file_desc {
                Ok(decoded) => {
                    let key = decoded.name();

                    for dep in &decoded.dependency {
                        dependency_paths.insert(dep.to_owned());
                    }

                    decoded_files.insert(key.to_string(), decoded);
                }
                _ => {}
            };
        }

        let dependency_file_bytes =
            reflect_decode_files_bytes(&mut client, dependency_paths.into_iter().collect())
                .await
                .expect("Failed to get dependency file bytes");

        for bytes in dependency_file_bytes {
            let slice = bytes.as_slice();
            let file_desc = FileDescriptorProto::decode(slice);

            match file_desc {
                Ok(decoded) => {
                    let key = decoded.name();

                    decoded_depdendencies.insert(key.to_string(), decoded);
                }
                _ => {}
            }
        }

        match pool.add_file_descriptor_protos(
            decoded_depdendencies
                .values()
                .cloned()
                .collect::<Vec<FileDescriptorProto>>(),
        ) {
            Ok(_) => {}
            Err(e) => bail!("Failed to add dependency to DescriptorPool: {}", e),
        };

        match pool.add_file_descriptor_protos(
            decoded_files
                .values()
                .cloned()
                .collect::<Vec<FileDescriptorProto>>(),
        ) {
            Ok(_) => {}
            Err(e) => bail!("Failed to add file to DescriptorPool: {}", e),
        };
    }

    Ok(())
}

async fn reflect_decode_files_bytes(
    client: &mut ServerReflectionClient<Channel>,
    file_paths: Vec<String>,
) -> Result<Vec<Vec<u8>>> {
    let service_requests: Vec<ServerReflectionRequest> = file_paths
        .into_iter()
        .map(|path| ServerReflectionRequest {
            host: String::new(),
            message_request: Some(MessageRequest::FileContainingSymbol(path)),
        })
        .collect();

    let file_responses = client
        .server_reflection_info(Request::new(tokio_stream::iter(service_requests)))
        .await?
        .into_inner()
        .collect::<Vec<_>>()
        .await
        .into_iter()
        .filter_map(Result::ok)
        .filter_map(|resp| resp.message_response)
        .filter_map(|msg| match msg {
            MessageResponse::FileDescriptorResponse(files) => Some(files),
            _ => None,
        })
        .collect::<Vec<FileDescriptorResponse>>();

    Ok(file_responses
        .into_iter()
        .flat_map(|f| f.file_descriptor_proto)
        .collect::<Vec<Vec<u8>>>())
}
