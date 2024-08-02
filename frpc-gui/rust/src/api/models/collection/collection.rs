use crate::api::models::environment::environment::Environment;
use serde::{Deserialize, Serialize};

#[derive(Debug, Serialize, Deserialize)]
pub struct Collection {
    pub id: String,
    pub display_name: String,
    pub environments: Vec<Environment>,
    pub loader_type: CollectionLoader,
    pub icon_path: Option<String>,
}

#[derive(Debug, Serialize, Deserialize)]
pub enum CollectionLoader {
    ServerReflection,
    File(FileCollectionLoader),
}

#[derive(Debug, Serialize, Deserialize)]
pub struct FileCollectionLoader {
    pub proto_paths: Vec<String>,
    pub include_path: String,
}
