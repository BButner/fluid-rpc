use crate::api::models::descriptors::field_descriptor::FieldDescriptor;
use crate::api::models::descriptors::oneof_descriptor::OneOfDescriptor;

#[derive(Debug, Clone)]
pub struct MessageDescriptor {
    pub name: String,
    // pub parent: Option<MessageDescriptor>,
    pub fields: Vec<FieldDescriptor>,
    pub one_ofs: Vec<OneOfDescriptor>,
}

impl From<prost_reflect::MessageDescriptor> for MessageDescriptor {
    fn from(message: prost_reflect::MessageDescriptor) -> Self {
        MessageDescriptor {
            name: message.name().to_string(),
            fields: message
                .fields()
                .map(|field| FieldDescriptor::from(field))
                .collect(),
            one_ofs: message.oneofs().map(|o| OneOfDescriptor::from(o)).collect(), // parent: match message.parent_message() {
                                                                                   //     Some(msg) => Some(Me),
                                                                                   // },
        }
    }
}
