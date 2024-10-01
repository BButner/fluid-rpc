use chrono::{DateTime, Local};
use prost_reflect::DynamicMessage;

#[derive(Debug)]
pub struct FluidMessageReceived {
    pub date_time: DateTime<Local>,
    pub message: DynamicMessage,
}

impl FluidMessageReceived {
    pub fn new(message: DynamicMessage) -> FluidMessageReceived {
        FluidMessageReceived {
            date_time: Local::now(),
            message,
        }
    }
}
