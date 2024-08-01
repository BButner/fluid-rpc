use serde::{Deserialize, Serialize};
use crate::api::models::connection::tls_type::TlsType;

#[derive(Debug, Serialize, Deserialize)]
pub struct ConnectionConfig {
    pub host: String,
    pub port: u16,
    pub tls_type: TlsType,
}