use flutter_rust_bridge::frb;

use super::message_descriptor::MessageDescriptor;

#[derive(Debug, Clone)]
pub struct MethodDescriptor {
    pub name: String,
    pub full_name: String,
    pub parent_service_name: String,
    pub input: MessageDescriptor,
    pub output: MessageDescriptor,
    pub is_server_streaming: bool,
}

impl MethodDescriptor {
    #[frb(sync)]
    pub fn target(&self) -> String {
        let split = self
            .full_name
            .rsplit_once('.')
            .expect("Could not get method target!");

        format!("{}/{}", split.0, split.1)
    }
}

impl From<prost_reflect::MethodDescriptor> for MethodDescriptor {
    fn from(method: prost_reflect::MethodDescriptor) -> Self {
        MethodDescriptor {
            name: method.name().to_string(),
            full_name: method.full_name().to_string(),
            parent_service_name: method.parent_service().full_name().to_string(),
            input: MessageDescriptor::from(method.input()),
            output: MessageDescriptor::from(method.input()),
            is_server_streaming: method.is_server_streaming(),
        }
    }
}
