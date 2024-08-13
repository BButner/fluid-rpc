use serde::{Deserialize, Serialize};

#[derive(Debug, Serialize, Deserialize)]
pub struct TlsTypeTwoWay {
    pub certificate_path: String,
    pub client_certificate_path: String,
    pub client_key_path: String,
}