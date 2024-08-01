use crate::api::models::descriptors::enum_descriptor::EnumDescriptor;
use crate::api::models::descriptors::message_descriptor::MessageDescriptor;

#[derive(Debug, Clone)]
pub enum FieldTypeDescriptor {
    Double,
    Float,
    Int32,
    Int64,
    Uint32,
    Uint64,
    Sint32,
    Sint64,
    Fixed32,
    Fixed64,
    Sfixed32,
    Sfixed64,
    Bool,
    String,
    Bytes,
    Message(MessageDescriptor),
    Enum(EnumDescriptor),
}

impl From<prost_reflect::Kind> for FieldTypeDescriptor {
    fn from(kind: prost_reflect::Kind) -> Self {
        match kind {
            prost_reflect::Kind::Double => FieldTypeDescriptor::Double,
            prost_reflect::Kind::Float => FieldTypeDescriptor::Float,
            prost_reflect::Kind::Int32 => FieldTypeDescriptor::Int32,
            prost_reflect::Kind::Int64 => FieldTypeDescriptor::Int64,
            prost_reflect::Kind::Uint32 => FieldTypeDescriptor::Uint32,
            prost_reflect::Kind::Uint64 => FieldTypeDescriptor::Uint64,
            prost_reflect::Kind::Sint32 => FieldTypeDescriptor::Sint32,
            prost_reflect::Kind::Sint64 => FieldTypeDescriptor::Sint64,
            prost_reflect::Kind::Fixed32 => FieldTypeDescriptor::Fixed32,
            prost_reflect::Kind::Fixed64 => FieldTypeDescriptor::Fixed64,
            prost_reflect::Kind::Sfixed32 => FieldTypeDescriptor::Sfixed32,
            prost_reflect::Kind::Sfixed64 => FieldTypeDescriptor::Sfixed64,
            prost_reflect::Kind::Bool => FieldTypeDescriptor::Bool,
            prost_reflect::Kind::String => FieldTypeDescriptor::String,
            prost_reflect::Kind::Bytes => FieldTypeDescriptor::Bytes,
            prost_reflect::Kind::Message(msg) => {
                FieldTypeDescriptor::Message(MessageDescriptor::from(msg))
            }
            prost_reflect::Kind::Enum(e) => FieldTypeDescriptor::Enum(EnumDescriptor::from(e)),
        }
    }
}
