use std::error::Error;

use chrono::{DateTime, Local};

#[derive(Debug)]
pub struct FluidError {
    pub date_time: DateTime<Local>,
    pub error: Box<dyn Error + Send + Sync>,
}

impl FluidError {
    pub fn new(error: Box<dyn Error + Send + Sync>) -> FluidError {
        FluidError {
            date_time: Local::now(),
            error,
        }
    }
}
