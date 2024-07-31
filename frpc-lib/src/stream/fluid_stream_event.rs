use tokio::time::Instant;

use super::{fluid_error::FluidError, fluid_message_received::FluidMessageReceived};

pub enum FluidStreamEvent {
    InitiatingConnection(Instant),
    Connected(Instant),
    Error(FluidError),
    StreamingMessageReceived(FluidMessageReceived),
    UnaryMessageReceived(FluidMessageReceived),
}
