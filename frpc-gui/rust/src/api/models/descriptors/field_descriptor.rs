use crate::api::models::descriptors::field_type_descriptor::FieldTypeDescriptor;

#[derive(Debug, Clone)]
pub struct FieldDescriptor {
    pub name: String,
    pub index: u32,
    pub field_type: FieldTypeDescriptor,
    pub is_repeated: bool,
}

impl From<prost_reflect::FieldDescriptor> for FieldDescriptor {
    fn from(field: prost_reflect::FieldDescriptor) -> Self {
        FieldDescriptor {
            name: field.name().to_string(),
            index: field.number(),
            field_type: FieldTypeDescriptor::from(field.kind()),
            is_repeated: field.cardinality() == prost_reflect::Cardinality::Repeated,
        }
    }
}
