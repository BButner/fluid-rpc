use chrono::{DateTime, Local};
use flutter_rust_bridge::frb;
use prost_reflect::text_format::FormatOptions;

#[derive(Debug)]
#[frb(non_opaque)]
pub enum FluidFrontendStreamEvent {
    InitiatingConnection(DateTime<Local>),
    Connected(DateTime<Local>),
    Error(FluidError),
    StreamingMessageReceived { message: FluidMessageReceived },
    UnaryMessageReceived { message: FluidMessageReceived },
}

#[derive(Debug)]
#[frb(non_opaque)]
pub struct FluidError {
    pub date_time: DateTime<Local>,
    pub error: String,
}

#[derive(Debug)]
#[frb(non_opaque)]
pub struct FluidMessageReceived {
    pub date_time: DateTime<Local>,
    pub contents: String,
}

impl From<frpc_lib::stream::fluid_error::FluidError> for FluidError {
    fn from(err: frpc_lib::stream::fluid_error::FluidError) -> Self {
        FluidError {
            date_time: Local::now(),
            error: err.error.to_string(),
        }
    }
}

impl From<frpc_lib::stream::fluid_message_received::FluidMessageReceived> for FluidMessageReceived {
    fn from(message: frpc_lib::stream::fluid_message_received::FluidMessageReceived) -> Self {
        let options = FormatOptions::new()
            .pretty(true)
            .expand_any(true)
            .skip_unknown_fields(false);

        FluidMessageReceived {
            date_time: Local::now(),
            contents: message.message.to_text_format_with_options(&options),
        }
    }
}

impl From<frpc_lib::stream::fluid_stream_event::FluidStreamEvent> for FluidFrontendStreamEvent {
    fn from(event: frpc_lib::stream::fluid_stream_event::FluidStreamEvent) -> Self {
        match event {
            frpc_lib::stream::fluid_stream_event::FluidStreamEvent::InitiatingConnection(inst) => {
                Self::InitiatingConnection(inst)
            }
            frpc_lib::stream::fluid_stream_event::FluidStreamEvent::Connected(inst) => {
                Self::Connected(inst)
            }
            frpc_lib::stream::fluid_stream_event::FluidStreamEvent::Error(err) => {
                Self::Error(FluidError::from(err))
            }
            frpc_lib::stream::fluid_stream_event::FluidStreamEvent::StreamingMessageReceived(
                message,
            ) => Self::StreamingMessageReceived {
                message: FluidMessageReceived::from(message),
            },
            frpc_lib::stream::fluid_stream_event::FluidStreamEvent::UnaryMessageReceived(
                message,
            ) => Self::UnaryMessageReceived {
                message: FluidMessageReceived::from(message),
            },
        }
    }
}
