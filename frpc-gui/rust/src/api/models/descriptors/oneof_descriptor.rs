#[derive(Debug, Clone)]
pub struct OneOfDescriptor {
    pub name: String,
    // pub message: MessageDescriptor,
}

impl From<prost_reflect::OneofDescriptor> for OneOfDescriptor {
    fn from(one_of: prost_reflect::OneofDescriptor) -> Self {
        OneOfDescriptor {
            name: one_of.name().to_string(),
            // message:
        }
    }
}
