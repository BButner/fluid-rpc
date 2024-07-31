use std::error::Error;

use tokio::time::Instant;

#[derive(Debug)]
pub struct FluidError {
    pub instant: Instant,
    pub error: Box<dyn Error + Send + Sync>,
}

impl FluidError {
    pub fn new(error: Box<dyn Error + Send + Sync>) -> FluidError {
        FluidError {
            instant: Instant::now(),
            error,
        }
    }
}
