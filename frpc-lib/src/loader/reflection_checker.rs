use anyhow::{bail, Result};

use super::{reflection_loader_v1, reflection_loader_v1alpha};

pub enum ReflectionVersion {
    V1,
    V1Alpha,
}

pub(crate) async fn try_get_reflection_version(server_url: String) -> Result<ReflectionVersion> {
    let v1_implemented = reflection_loader_v1::check_implemented(server_url.clone()).await;

    if v1_implemented.is_ok_and(|implemented| implemented) {
        return Ok(ReflectionVersion::V1);
    }

    let v1alpha_implemented = reflection_loader_v1alpha::check_implemented(server_url).await;

    if v1alpha_implemented.is_ok_and(|implemented| implemented) {
        return Ok(ReflectionVersion::V1Alpha);
    }

    bail!("Could not determine version!");
}
