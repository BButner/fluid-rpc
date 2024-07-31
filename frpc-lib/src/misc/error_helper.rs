use std::error::Error;

use futures::channel::mpsc::UnboundedSender;

use crate::{
    invoker::invoker_error::InvokerError,
    stream::{fluid_error::FluidError, fluid_stream_event::FluidStreamEvent},
};

// This is really just to clean up the code in the invoker...
pub fn send_invoker_error(
    tx: &mut UnboundedSender<FluidStreamEvent>,
    err: InvokerError,
) -> Box<dyn Error + Send + Sync> {
    match tx.unbounded_send(FluidStreamEvent::Error(FluidError::new(Box::new(
        err.clone(),
    )))) {
        Ok(_) => Box::new(err),
        Err(e) => Box::new(e),
    }
}
