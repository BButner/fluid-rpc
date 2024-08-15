use super::method_descriptor::MethodDescriptor;

#[derive(Debug, Clone)]
pub struct ServiceDescriptor {
    pub name: String,
    pub full_name: String,
    pub file_path: String,
    pub methods: Vec<MethodDescriptor>,
}

impl From<prost_reflect::ServiceDescriptor> for ServiceDescriptor {
    fn from(service: prost_reflect::ServiceDescriptor) -> Self {
        ServiceDescriptor {
            name: service.name().to_string(),
            full_name: service.full_name().to_string(),
            file_path: String::from("TODO"),
            methods: service
                .methods()
                .map(|msg| MethodDescriptor::from(msg))
                .collect(),
        }
    }
}
