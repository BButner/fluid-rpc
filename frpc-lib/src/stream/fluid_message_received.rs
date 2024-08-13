use prost_reflect::DynamicMessage;
use std::time::Instant;

#[derive(Debug)]
pub struct FluidMessageReceived {
    pub instant: Instant,
    pub message: DynamicMessage,
}

impl FluidMessageReceived {
    pub fn new(message: DynamicMessage) -> FluidMessageReceived {
        FluidMessageReceived {
            instant: Instant::now(),
            message,
        }
    }
}
