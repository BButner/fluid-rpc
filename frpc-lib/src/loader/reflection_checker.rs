use std::error::Error;

use anyhow::{bail, Result};
use tonic::ConnectError;

use super::{reflection_loader_v1, reflection_loader_v1alpha};

#[derive(Debug)]
pub enum TryGetReflectionVersionResponse {
    DetectedVersion(ReflectionVersion),
    VersionUndetectable,
    ConnectionError,
}

#[derive(Debug)]
pub enum ReflectionVersion {
    V1,
    V1Alpha,
}

pub(crate) async fn try_get_reflection_version(
    server_url: String,
) -> Result<TryGetReflectionVersionResponse> {
    let v1_implemented = reflection_loader_v1::check_implemented(server_url.clone()).await;

    match v1_implemented {
        Ok(true) => {
            return Ok(TryGetReflectionVersionResponse::DetectedVersion(
                ReflectionVersion::V1,
            ))
        }
        Ok(_) => {}
        Err(e) => {
            if let Some(transport) = e.downcast_ref::<tonic::transport::Error>() {
                let source = transport.source();

                match source {
                    Some(source) => {
                        if source.is::<tonic::ConnectError>() {
                            return Ok(TryGetReflectionVersionResponse::ConnectionError);
                        }
                    }
                    None => {}
                };
            }
        }
    };

    let v1alpha_implemented = reflection_loader_v1alpha::check_implemented(server_url).await;

    match v1alpha_implemented {
        Ok(true) => {
            return Ok(TryGetReflectionVersionResponse::DetectedVersion(
                ReflectionVersion::V1Alpha,
            ))
        }
        Ok(_) => {}
        Err(e) => {
            if let Some(transport) = e.downcast_ref::<tonic::transport::Error>() {
                let source = transport.source();

                match source {
                    Some(source) => {
                        if source.is::<tonic::ConnectError>() {
                            return Ok(TryGetReflectionVersionResponse::ConnectionError);
                        }
                    }
                    None => {}
                };
            }
        }
    };

    Ok(TryGetReflectionVersionResponse::VersionUndetectable)
}
