#[derive(Debug, Clone)]
pub struct EnumDescriptor {
    // pub parent: Option<MessageDescriptor>,
    pub values: Vec<EnumValueDescriptor>,
}

impl From<prost_reflect::EnumDescriptor> for EnumDescriptor {
    fn from(e: prost_reflect::EnumDescriptor) -> Self {
        EnumDescriptor {
            values: e.values().map(|v| EnumValueDescriptor::from(v)).collect(),
        }
    }
}

#[derive(Debug, Clone)]
pub struct EnumValueDescriptor {
    pub name: String,
    pub index: i32,
}

impl From<prost_reflect::EnumValueDescriptor> for EnumValueDescriptor {
    fn from(value: prost_reflect::EnumValueDescriptor) -> Self {
        EnumValueDescriptor {
            name: value.name().to_string(),
            index: value.number(),
        }
    }
}
