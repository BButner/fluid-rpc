use anyhow::{bail, Result};
use futures::channel::mpsc::{self, UnboundedReceiver};
use invoker::invoker::{invoke, invoke_with_pool};
use loader::reflection_checker::{ReflectionVersion, TryGetReflectionVersionResponse};
use prost_reflect::DescriptorPool;
use stream::fluid_stream_event::FluidStreamEvent;
use tokio_util::sync::CancellationToken;

pub(crate) mod invoker;
pub mod loader;
pub mod misc;
pub mod stream;

pub async fn list_from_server_reflection(
    server_url: String,
    reflection_version: Option<ReflectionVersion>,
) -> Result<DescriptorPool> {
    let pool = match reflection_version {
        Some(version) => load_reflection_data(server_url, version),
        None => {
            let auto_detect_verison =
                loader::reflection_checker::try_get_reflection_version(server_url.clone()).await?;

            let version = match auto_detect_verison {
                TryGetReflectionVersionResponse::DetectedVersion(version) => version,
                TryGetReflectionVersionResponse::ConnectionError { error } => bail!(error),
                TryGetReflectionVersionResponse::VersionUndetectable => {
                    bail!("Could not determine reflection version.")
                }
            };

            load_reflection_data(server_url, version)
        }
    }
    .await?;

    Ok(pool)
}

async fn load_reflection_data(
    server_url: String,
    reflection_version: ReflectionVersion,
) -> Result<DescriptorPool> {
    Ok(match reflection_version {
        ReflectionVersion::V1 => {
            loader::reflection_loader_v1::load_from_server_reflection(server_url).await?
        }
        ReflectionVersion::V1Alpha => {
            loader::reflection_loader_v1alpha::load_from_server_reflection(server_url).await?
        }
    })
}

pub async fn list_from_files(
    file_paths: Vec<String>,
    include_paths: Vec<String>,
) -> Result<DescriptorPool> {
    let pool = loader::file_loader::load_from_files(file_paths, include_paths)?;

    Ok(pool)
}

pub async fn invoke_method(
    server_url: String,
    target_method: String,
    data: Option<String>,
    file_paths: Option<Vec<String>>,
    include_paths: Option<Vec<String>>,
    cancellation_token: CancellationToken,
) -> Result<UnboundedReceiver<FluidStreamEvent>> {
    let (tx, rx) = mpsc::unbounded::<FluidStreamEvent>();

    tokio::spawn(invoke(
        tx,
        server_url,
        target_method,
        data,
        file_paths,
        include_paths,
        cancellation_token,
    ));

    Ok(rx)
}

pub async fn invoke_method_raw(
    pool_bytes: Vec<u8>,
    server_url: String,
    target_method: String,
    data: Option<String>,
    cancellation_token: CancellationToken,
) -> Result<UnboundedReceiver<FluidStreamEvent>> {
    let pool = DescriptorPool::decode(pool_bytes.as_slice())?;

    let (tx, rx) = mpsc::unbounded::<FluidStreamEvent>();

    tokio::spawn(invoke_with_pool(
        tx,
        pool,
        server_url,
        target_method,
        data,
        cancellation_token,
    ));

    Ok(rx)
}
