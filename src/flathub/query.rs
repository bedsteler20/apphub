use serde::Deserialize;

use super::json_helpers::deserialize_bool;

pub enum Query {
    Popular,
    RecentlyAdded,
    RecentlyUpdated
}

#[derive(Deserialize, Debug)]
pub struct QueryInfo {
    pub query: String,
    pub hits: Vec<AppHit>,
    #[serde(rename = "processingTimeMs")]
    pub processing_time_ms: i32,
    #[serde(rename = "hitsPerPage")]
    pub hits_per_page: i32,
    pub page: i32,
    #[serde(rename = "totalPages")]
    pub total_pages: i32,
    #[serde(rename = "totalHits")]
    pub total_hits: i32,
}

#[derive(Deserialize, Debug)]
pub struct AppHit {
    pub app_id: String,
    pub name: String,
    pub summary: String,
    pub description: Option<String>,
    pub icon: Option<String>, // Runtime's don't have an icon
    pub developer_name: Option<String>,
    #[serde(deserialize_with = "deserialize_bool")]
    pub verification_verified: bool,
    pub verification_method: Option<String>,
    pub verification_login_name: Option<String>,
    pub verification_login_provider: Option<String>,
    pub verification_website: Option<String>,
}
