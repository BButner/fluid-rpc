use prost_reflect::DescriptorPool;

use crate::api::models::descriptors::service_descriptor::ServiceDescriptor;

#[derive(Debug, Clone)]
pub struct ServerDescriptor {
    pub services: Vec<ServiceDescriptor>,
    pub descriptor_pool_bytes: Vec<u8>,
}

impl From<DescriptorPool> for ServerDescriptor {
    fn from(pool: DescriptorPool) -> Self {
        ServerDescriptor {
            services: pool
                .services()
                .map(|service| ServiceDescriptor::from(service))
                .collect(),
            descriptor_pool_bytes: pool.encode_to_vec(),
        }
    }
}
