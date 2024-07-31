use crate::loader::loader_error::LoaderError;
use anyhow::{bail, Result};
use prost_reflect::DescriptorPool;
use std::path::Path;

pub(crate) fn load_from_files(
    file_paths: Vec<String>,
    include_paths: Vec<String>,
) -> Result<DescriptorPool> {
    let mut pool = DescriptorPool::new();

    for path in &file_paths {
        if !Path::exists(Path::new(&path)) {
            bail!(LoaderError::FileNotFound(path.clone()));
        }
    }

    let compiled = protox::compile(file_paths.into_iter(), include_paths);

    match compiled {
        Ok(c) => match pool.add_file_descriptor_set(c) {
            Ok(_) => Ok(pool),
            Err(err) => bail!(LoaderError::CompilationError(err.to_string())),
        },
        Err(err) => bail!(LoaderError::CompilationError(err.to_string())),
    }
}
