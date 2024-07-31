use thiserror::Error;

#[derive(Error, Debug, Clone)]
pub enum InvokerError {
    #[error("Inavlid arguments supplied. Details: '{0}'")]
    InvalidArguments(String),
    #[error("Invalid target method '{0}'. Must be in the format of com.example.package.YourService/YourMethodName")]
    InvalidTargetMethod(String),
    #[error("Failed to load the DescriptorPool. Details: '{0}'")]
    DescriptorPoolLoadFailed(String),
    #[error("Failed to find service with path '{0}'")]
    ServiceNotFound(String),
    #[error("Failed to find method with name '{0}'")]
    MethodNotFound(String),
    #[error("Failed to create connection. Details: '{0}'")]
    CreateConnectionFailed(String),
    #[error("Failed to decode DynamicMessage. Details: '{0}'")]
    DynamicMessageDecodingFailed(String),
    #[error("Error during streaming request. Details: '{0}'")]
    StreamingError(String),
    #[error("Error during unary request. Details: '{0}'")]
    UnaryError(String),
}
