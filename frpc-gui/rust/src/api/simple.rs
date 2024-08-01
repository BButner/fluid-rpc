use std::fmt::format;

use anyhow::Result;
use frpc_lib::invoke_method;
use futures::StreamExt;

use crate::frb_generated::StreamSink;

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

// async fn test(sink: StreamSink)

#[flutter_rust_bridge::frb(init)]
pub fn init_app() {
    // Default utilities - feel free to customize
    flutter_rust_bridge::setup_default_user_utils();
}
