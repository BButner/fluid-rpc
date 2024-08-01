use crate::api::models::environment::environment::Environment;
use serde::{Deserialize, Serialize};

#[derive(Debug, Serialize, Deserialize)]
pub struct Collection {
    pub id: String,
    pub display_name: String,
    pub environments: Vec<Environment>,
    pub icon_path: Option<String>,
}
