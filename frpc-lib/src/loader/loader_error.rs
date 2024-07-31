use thiserror::Error;

#[derive(Error, Debug)]
pub enum LoaderError {
    #[error("File not found: '{0}'")]
    FileNotFound(String),
    #[error("Compilation error: '{0}'")]
    CompilationError(String),
}
