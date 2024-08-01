use std::{
    fs::{read_to_string, write},
    path::PathBuf,
};

use anyhow::Result;
use serde::{Deserialize, Serialize};
use serde_json::from_str;

use crate::api::models::collection::collection::Collection;

#[derive(Debug, Serialize, Deserialize)]
pub struct AppConfig {
    pub collections: Vec<Collection>,
}

impl AppConfig {
    pub fn new() -> Self {
        AppConfig {
            collections: Vec::new(),
        }
    }

    pub async fn load(path: String) -> Result<Self> {
        let path = PathBuf::from(path);

        if !path.exists() {
            let default_config = AppConfig::new();
            let json = serde_json::to_string_pretty(&default_config)?;

            write(&path, json.as_bytes())?;
            return Ok(default_config);
        }

        let data = read_to_string(&path)?;
        Ok(from_str(&data)?)
    }
}
