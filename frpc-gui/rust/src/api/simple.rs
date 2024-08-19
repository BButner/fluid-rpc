use std::{fmt::format, sync::Arc};

use anyhow::Result;
use flutter_rust_bridge::frb;
use frpc_lib::{invoke_method, invoke_method_raw};
use futures::StreamExt;
pub use tokio_util::sync::CancellationToken;

use crate::frb_generated::StreamSink;

use super::models::{
    descriptors::server_descriptor::ServerDescriptor, stream_event::FluidFrontendStreamEvent,
};

#[flutter_rust_bridge::frb(sync)] // Synchronous mode for simplicity of the demo
pub fn greet(name: String) -> String {
    format!("Hello, {name}!")
}

pub struct CancelableExecution {
    token: CancellationToken,
}

impl CancelableExecution {
    #[frb(sync)]
    pub fn cancel(&self) {
        self.token.cancel();
    }

    pub fn new() -> Self {
        CancelableExecution {
            token: CancellationToken::new(),
        }
    }
}

impl Default for CancelableExecution {
    fn default() -> Self {
        Self::new()
    }
}

pub async fn test_invoke(
    server_url: String,
    target: String,
    sink: StreamSink<String>,
    cancel_exec: &CancelableExecution,
) -> Result<()> {
    let mut stream = invoke_method(
        server_url,
        target,
        None,
        None,
        None,
        cancel_exec.token.clone(),
    )
    .await
    .unwrap();

    while let Some(item) = stream.next().await {
        sink.add(String::from(format!("{:?}", item)));
    }

    Ok(())
}

pub async fn test_invoke_with_pool(
    desc: ServerDescriptor,
    server_url: String,
    target: String,
    sink: StreamSink<FluidFrontendStreamEvent>,
    cancel_exec: &CancelableExecution,
) -> Result<()> {
    let mut stream = invoke_method_raw(
        desc.descriptor_pool_bytes,
        server_url,
        target,
        None,
        cancel_exec.token.clone(),
    )
    .await
    .unwrap();

    while let Some(item) = stream.next().await {
        let _ = sink.add(FluidFrontendStreamEvent::from(item));
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
