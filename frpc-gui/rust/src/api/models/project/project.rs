use anyhow::{bail, Result};
use std::path::PathBuf;
use tokio::{
    fs::{create_dir, write, File},
    io::AsyncReadExt,
};

use crate::api::models::environment::environment::Environment;
use serde::{Deserialize, Serialize};

const PROJECT_FILE_EXTENSION: &str = ".frpc";

#[derive(Debug, Serialize, Deserialize)]
pub struct Project {
    pub id: String,
    pub display_name: String,
    pub environments: Vec<Environment>,
    pub loader_type: ProjectLoader,
    pub icon_path: Option<String>,
}

#[derive(Debug)]
pub struct LoadedProject {
    pub project: Project,
    pub project_directory_path: String,
}

impl Project {
    #[flutter_rust_bridge::frb(sync)]
    pub fn get_default_avatar(display_name: String) -> String {
        display_name
            .trim()
            .split(" ")
            .take(2)
            .map(|s| s.chars().nth(0).unwrap().to_string())
            .collect::<Vec<String>>()
            .join("")
            .to_uppercase()
    }

    pub async fn load_project(config_file_path: String) -> Result<Option<LoadedProject>> {
        if !config_file_path
            .to_lowercase()
            .ends_with(PROJECT_FILE_EXTENSION)
        {
            bail!(
                "Attempted to load an invalid file. Must be a {} file!",
                PROJECT_FILE_EXTENSION
            );
        }

        let config_file_path = PathBuf::from(config_file_path);

        if !config_file_path.exists() || !config_file_path.is_file() {
            return Ok(None);
        }

        dbg!(&config_file_path);

        let mut file = File::open(&config_file_path).await?;

        let mut buffer = String::new();

        file.read_to_string(&mut buffer).await?;

        let project: Project = serde_json::from_str(&buffer)?;

        let project_directory_path = match &config_file_path.parent() {
            Some(path) => String::from(path.to_str().unwrap()),
            None => bail!("Could not get parent directory of path '{:?}'.", {
                &config_file_path
            }),
        };

        Ok(Some(LoadedProject {
            project,
            project_directory_path,
        }))
    }

    pub async fn save(&self, project_directory_path: String) -> Result<()> {
        let project_directory_path = PathBuf::from(project_directory_path);

        if !project_directory_path.is_dir() {
            bail!("Path '{:?}' is not a directory!", project_directory_path);
        }

        let project_file_path =
            project_directory_path.join(format!("{}{}", self.display_name, PROJECT_FILE_EXTENSION));

        dbg!(&project_file_path);

        let contents = serde_json::to_string_pretty(&self)?;

        let mut file = File::create(&project_file_path).await?;

        write(&project_file_path, contents).await?;
        
        Ok(())
    }

    async fn check_create_dir(path: &PathBuf) -> Result<()> {
        println!("Using Collections directory at '{:?}'", &path.as_path());

        if !path.exists() {
            if let Err(e) = create_dir(&path).await {
                bail!(
                    "Could not create Collections directory '{:?}'. Details: {:?}",
                    &path.as_path(),
                    e
                );
            } else {
                println!("Created Collections directory at '{:?}'.", &path.as_path());
            }
        }

        Ok(())
    }
}

#[derive(Debug, Serialize, Deserialize)]
pub enum ProjectLoader {
    ServerReflection,
    File(FileProjectLoader),
}

#[derive(Debug, Serialize, Deserialize)]
pub struct FileProjectLoader {
    pub proto_paths: Vec<String>,
    pub include_path: String,
}
