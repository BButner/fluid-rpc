use chrono::{DateTime, Local};

use super::{fluid_error::FluidError, fluid_message_received::FluidMessageReceived};

#[derive(Debug)]
pub enum FluidStreamEvent {
    InitiatingConnection(DateTime<Local>),
    Connected(DateTime<Local>),
    Error(FluidError),
    StreamingMessageReceived(FluidMessageReceived),
    UnaryMessageReceived(FluidMessageReceived),
}
