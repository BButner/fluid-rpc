use std::{
    collections::HashMap,
    fs::{read_to_string, write},
    path::PathBuf,
};

use anyhow::Result;
use flutter_rust_bridge::frb;
use serde::{Deserialize, Serialize};
use serde_json::from_str;

const APP_CONFIG_FILE_NAME: &str = "config.json";

#[derive(Debug, Serialize, Deserialize)]
pub struct AppConfig {
    pub cached_project_paths: HashMap<String, String>,
}

impl AppConfig {
    pub fn new() -> Self {
        AppConfig {
            cached_project_paths: HashMap::new(),
        }
    }

    pub(crate) fn add_update_cached_project(&mut self, id: String, config_file_path: String) {
        self.cached_project_paths.insert(id, config_file_path);
    }

    pub async fn save(&self, app_settings_directory: String) -> Result<()> {
        let path = PathBuf::from(app_settings_directory).join(APP_CONFIG_FILE_NAME);

        let json = serde_json::to_string_pretty(&self)?;

        write(&path, json.as_bytes())?;

        Ok(())
    }

    pub async fn load(app_settings_directory: String) -> Result<Self> {
        let path = PathBuf::from(app_settings_directory).join(APP_CONFIG_FILE_NAME);

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
