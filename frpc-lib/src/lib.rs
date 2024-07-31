use anyhow::Result;
use futures::channel::mpsc::{self, UnboundedReceiver};
use invoker::invoker::invoke;
use stream::fluid_stream_event::FluidStreamEvent;

pub(crate) mod invoker;
pub(crate) mod loader;
pub mod misc;
pub mod stream;

pub mod reflection {
    tonic::include_proto!("grpc.reflection.v1alpha");
}

pub async fn list_from_server_reflection(server_url: String) -> Result<()> {
    let pool = loader::reflection_loader::load_from_server_reflection(server_url).await?;

    for service in pool.services() {
        println!(
            "Service: {}\n  - Path: '{}'",
            service.name(),
            service.package_name()
        );

        println!("    Methods:");

        for method in service.methods() {
            println!(
                "      - {} ({}) -> ({})",
                method.name(),
                method.input().name(),
                method.output().name()
            );
        }
    }

    Ok(())
}

pub async fn list_from_files(file_paths: Vec<String>, include_paths: Vec<String>) {
    let pool = loader::file_loader::load_from_files(file_paths, include_paths).unwrap();

    for service in pool.services() {
        println!(
            "Service: {}\n  - Path: '{}'",
            service.name(),
            service.package_name()
        );

        println!("    Methods:");

        for method in service.methods() {
            println!(
                "      - {} ({}) -> ({})",
                method.name(),
                method.input().name(),
                method.output().name()
            );
        }
    }
}

pub async fn invoke_method(
    server_url: String,
    target_method: String,
    data: Option<String>,
    file_paths: Option<Vec<String>>,
    include_paths: Option<Vec<String>>,
) -> Result<UnboundedReceiver<FluidStreamEvent>> {
    let (tx, rx) = mpsc::unbounded::<FluidStreamEvent>();

    tokio::spawn(invoke(
        tx,
        server_url,
        target_method,
        data,
        file_paths,
        include_paths,
    ));

    Ok(rx)
}
