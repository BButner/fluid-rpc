use std::ffi::OsStr;
use std::fs::read_dir;
use std::path::Path;
use anyhow::{bail, Result};
use flutter_rust_bridge::frb;
use crate::api::models::project::project::{Project, PROJECT_FILE_EXTENSION};

pub struct ProjectUtilities {}

impl ProjectUtilities {
    #[frb(sync)]
    pub fn validate_project_dir(dir_path: &String) -> Result<Option<String>> {
        let dir_path = Path::new(dir_path);

        let exists = dir_path.try_exists();

        match exists {
            Ok(false) => return Ok(Some(String::from("Path does not exist."))),
            Err(e) => return Ok(Some(e.to_string())),
            Ok(true) => {
                if !dir_path.is_dir() {
                    return Ok(Some(String::from("Path must be a directory.")));
                }

                let files = read_dir(dir_path);

                match files {
                    Ok(mut read_dir) => {
                        let has_proj_file = read_dir.any(|res| {
                            if let Ok(entry) = res {
                                if let Some(extension) = entry.path().extension().and_then(OsStr::to_str) {
                                    extension.eq_ignore_ascii_case(PROJECT_FILE_EXTENSION)
                                } else {
                                    return false;
                                }
                            } else {
                                return false;
                            }
                        });

                        if has_proj_file {
                            return Ok(Some(String::from("Directory already has project file.")));
                        }
                    }
                    Err(e) => {
                        return Ok(Some(format!("Could not read directory: {}", e.to_string())));
                    }
                };
            }
        };

        Ok(None)
    }
}