// cspell:ignore filesystems
use serde::Deserialize;

#[derive(Deserialize, Debug)]
pub struct AppSummary {
    pub arches: Vec<String>,
    pub branch: String,
    pub timestamp: i64,
    pub download_size: u64,
    pub installed_size: u64,
}
