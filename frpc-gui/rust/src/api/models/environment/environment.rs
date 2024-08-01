use serde::{Deserialize, Serialize};

use crate::api::models::connection::connection_config::ConnectionConfig;

#[derive(Debug, Serialize, Deserialize)]
pub struct Environment {
    pub id: String,
    pub display_name: String,
    pub connections: Vec<ConnectionConfig>,
}
