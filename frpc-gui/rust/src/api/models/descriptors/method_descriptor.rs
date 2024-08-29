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

impl From<prost_reflect::MethodDescriptor> for MethodDescriptor {
    fn from(method: prost_reflect::MethodDescriptor) -> Self {
        let mut deserializer = Deserializer::from_str("{}");

        dbg!(&method.input());

        let dynamic_message =
            DynamicMessage::deserialize(method.clone().input(), &mut deserializer).unwrap();

        let mut serializer = serde_json::Serializer::with_formatter(vec![], PrettyFormatter::new());
        let options = SerializeOptions::new()
            .skip_default_fields(false)
            .use_proto_field_name(true);

        let res = dynamic_message.serialize_with_options(&mut serializer, &options);

        dbg!(res);

        MethodDescriptor {
            name: method.name().to_string(),
            full_name: method.full_name().to_string(),
            parent_service_name: method.parent_service().full_name().to_string(),
            input: MessageDescriptor::from(method.input()),
            output: MessageDescriptor::from(method.input()),
            is_server_streaming: method.is_server_streaming(),
            default_data: String::from_utf8(serializer.into_inner()).expect("ERROR"),
        }
    }
}
