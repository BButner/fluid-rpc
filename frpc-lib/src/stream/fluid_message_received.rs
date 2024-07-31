use prost_reflect::DynamicMessage;
use tokio::time::Instant;

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
