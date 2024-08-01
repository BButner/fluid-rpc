use super::message_descriptor::MessageDescriptor;

#[derive(Debug, Clone)]
pub struct MethodDescriptor {
    pub name: String,
    pub input: MessageDescriptor,
    pub output: MessageDescriptor,
}

impl From<prost_reflect::MethodDescriptor> for MethodDescriptor {
    fn from(method: prost_reflect::MethodDescriptor) -> Self {
        MethodDescriptor {
            name: method.name().to_string(),
            input: MessageDescriptor::from(method.input()),
            output: MessageDescriptor::from(method.input()),
        }
    }
}
