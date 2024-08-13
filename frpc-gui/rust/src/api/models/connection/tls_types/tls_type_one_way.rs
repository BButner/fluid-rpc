use serde::{Deserialize, Serialize};

#[derive(Debug, Serialize, Deserialize)]
pub struct TlsTypeOneWay {
    pub certificate_path: String,
}