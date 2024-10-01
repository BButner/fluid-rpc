use std::{any::Any, ops::Add};

use flutter_rust_bridge::frb;
use prost_reflect::{DynamicMessage, SerializeOptions};
use serde_json::{ser::PrettyFormatter, Deserializer};

use super::message_descriptor::MessageDescriptor;

#[derive(Debug, Clone)]
pub struct MethodDescriptor {
    pub name: String,
    pub full_name: String,
    pub parent_service_name: String,
    pub input: MessageDescriptor,
    pub output: MessageDescriptor,
    pub is_server_streaming: bool,
    pub default_data: String,
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

fn generate_default_data(message: &prost_reflect::MessageDescriptor, depth: u16) -> String {
    let mut return_string = String::from("{");

    let fields: Vec<prost_reflect::FieldDescriptor> = message.fields().collect();
    let fields_len = fields.len();

    for (i, field) in fields.into_iter().enumerate() {
        return_string += format!(
            "\n{}\"{}\": {}{}",
            "  ".repeat(usize::from(std::cmp::max(2 * depth, 1))),
            &field.name(),
            get_default_from_kind(&field.kind(), depth),
            if i < fields_len - 1 { "," } else { "" }
        )
        .as_str();
    }

    let space_prefixed = if depth <= 1 {
        String::from("  }")
    } else {
        "  ".repeat(usize::from(2 * (depth - 1))) + "}"
    };

    return_string += "\n";
    return_string += if depth > 0 {
        space_prefixed.as_str()
    } else {
        "}"
    };

    return return_string;
}

fn get_default_from_kind(kind: &prost_reflect::Kind, depth: u16) -> String {
    String::from(match kind {
        prost_reflect::Kind::Double => "0.0",
        prost_reflect::Kind::Float => "0.0",
        prost_reflect::Kind::Int32 => "0",
        prost_reflect::Kind::Int64 => "0",
        prost_reflect::Kind::Uint32 => "0",
        prost_reflect::Kind::Uint64 => "0",
        prost_reflect::Kind::Sint32 => "0",
        prost_reflect::Kind::Sint64 => "0",
        prost_reflect::Kind::Fixed32 => "0.0",
        prost_reflect::Kind::Fixed64 => "0.0",
        prost_reflect::Kind::Sfixed32 => "0.0",
        prost_reflect::Kind::Sfixed64 => "0.0",
        prost_reflect::Kind::Bool => "false",
        prost_reflect::Kind::String => "\"\"",
        prost_reflect::Kind::Bytes => "\"\"",
        prost_reflect::Kind::Message(msg) => {
            let resp = generate_default_data(msg, depth + 1);

            return resp;
        }
        prost_reflect::Kind::Enum(e) => {
            let default = e.default_value();

            return default.name().to_string();
        }
    })
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
            default_data: generate_default_data(&method.input(), 0),
        }
    }
}
