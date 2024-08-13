use std::fmt::format;

use anyhow::Result;
use frpc_lib::{invoke_method, invoke_method_raw};
use futures::StreamExt;

use crate::frb_generated::StreamSink;

use super::models::descriptors::server_descriptor::ServerDescriptor;

#[flutter_rust_bridge::frb(sync)] // Synchronous mode for simplicity of the demo
pub fn greet(name: String) -> String {
    format!("Hello, {name}!")
}

pub async fn test_invoke(
    server_url: String,
    target: String,
    sink: StreamSink<String>,
) -> Result<()> {
    let mut stream = invoke_method(server_url, target, None, None, None)
        .await
        .unwrap();

    while let Some(item) = stream.next().await {
        // dbg!(item);
        sink.add(String::from(format!("{:?}", item)));
    }

    Ok(())
}

pub async fn test_invoke_with_pool(
    desc: ServerDescriptor,
    server_url: String,
    target: String,
    sink: StreamSink<String>,
) -> Result<()> {
    let mut stream = invoke_method_raw(desc.descriptor_pool_bytes, server_url, target, None)
        .await
        .unwrap();

    while let Some(item) = stream.next().await {
        // dbg!(item);
        sink.add(String::from(format!("{:?}", item)));
    }

    Ok(())
}

pub async fn test_get_server_descriptor(server_url: String) -> Result<ServerDescriptor> {
    let pool = frpc_lib::list_from_server_reflection(server_url).await?;

    Ok(ServerDescriptor::from(pool))
}

// async fn test(sink: StreamSink)

#[flutter_rust_bridge::frb(init)]
pub fn init_app() {
    // Default utilities - feel free to customize
    flutter_rust_bridge::setup_default_user_utils();
}
