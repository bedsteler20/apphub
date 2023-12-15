use serde::de;
use serde::Deserialize;
use surf::Client as SurfClient;
use surf::{Config, Result};

pub struct Client {
    client: SurfClient,
}

impl Client {
    pub fn new() -> Self {
        let client: SurfClient = Config::new()
            .set_base_url("https://flathub.org/api/v2".parse().unwrap())
            .try_into()
            .unwrap();
        Self { client }
    }

    pub async fn query(&self, options: Query, page: i32, per_page: i32) -> Result<QueryInfo> {
        let path = match options {
            Query::Popular => "popular/last-month",
            Query::RecentlyAdded => "collection/recently-added",
            Query::RecentlyUpdated => "collection/recently-updated",
        };
        self.client
            .get(path)
            .query(&format!("page={page}&per_page={per_page}"))?
            .recv_json()
            .await
    }

    pub async fn app_info(&self, app_id: &str) -> Result<AppInfo> {
        self.client
            .get(format!("appstream/{}", app_id))
            .recv_json()
            .await
    }
}

// Json structs

pub enum Query {
    Popular,
    RecentlyAdded,
    RecentlyUpdated,
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

#[derive(Deserialize, Debug)]
pub struct AppInfo {
    pub id: String,
    pub name: String,
    pub summary: Option<String>,
    pub description: Option<String>,
    pub icon: Option<String>, // Runtime's don't have an icon
    pub developer_name: Option<String>,
    pub screenshots: Option<Vec<Screenshot>>,
    pub urls: Option<AppUrls>,
    pub project_license: Option<String>,
    pub metadata: Option<AppInfoMeta>,
    pub categories: Option<Vec<String>>,
    pub keywords: Option<Vec<String>>,
    pub kudos: Option<Vec<String>>,
    pub mimetypes: Option<Vec<String>>,
    pub provides: Option<Vec<String>>,
    pub is_free_license: Option<bool>,
    pub project_group: Option<String>,
    #[serde(rename = "type")]
    pub app_type: Option<String>,
    pub bundle: AppInfoBundle,
}

#[derive(Deserialize, Debug)]
pub struct ScreenshotSizes {
    #[serde(rename = "624x351")]
    pub _624x351: Option<String>,
    #[serde(rename = "1248x702")]
    pub _1284x702: Option<String>,
    #[serde(rename = "112x63")]
    pub _112x63: Option<String>,
    #[serde(rename = "224x126")]
    pub _224x126: Option<String>,
    #[serde(rename = "752x423")]
    pub _752x423: Option<String>,
    #[serde(rename = "1504x846")]
    pub _1504x846: Option<String>,
}

#[derive(Deserialize, Debug)]
pub struct Screenshot {
    pub default: Option<bool>,
    pub sizes: ScreenshotSizes,
}

#[derive(Deserialize, Debug)]
pub struct AppUrls {
    pub bugtracker: Option<String>,
    pub contact: Option<String>,
    pub contribute: Option<String>,
    pub donation: Option<String>,
    pub faq: Option<String>,
    pub help: Option<String>,
    pub homepage: Option<String>,
    pub translate: Option<String>,
    pub vcs_browser: Option<String>,
}

#[derive(Deserialize, Debug)]
pub struct AppInfoMeta {
    #[serde(
        rename = "flathub::verification::verified",
        deserialize_with = "deserialize_bool"
    )]
    pub verified: bool,
    #[serde(rename = "flathub::verification::timestamp")]
    pub verified_timestamp: Option<i64>,
    #[serde(rename = "flathub::verification::method")]
    pub verified_method: Option<String>,
    #[serde(rename = "flathub::verification::website")]
    pub verified_website: Option<String>,
    #[serde(rename = "flathub::verification::login_is_organization")]
    pub verified_login_is_organization: Option<bool>,
    #[serde(rename = "flathub::build::build_log_url")]
    pub build_log_url: Option<String>,
}

#[derive(Deserialize, Debug)]
pub struct AppInfoBundle {
    pub value: String,
    pub runtime: String,
    pub sdk: String,
}

pub fn deserialize_bool<'de, D>(deserializer: D) -> core::result::Result<bool, D::Error>
where
    D: de::Deserializer<'de>,
{
    if let Ok(s) = de::Deserialize::deserialize(deserializer) {
        match s {
            "true" => Ok(true),
            "false" => Ok(false),
            _ => Err(de::Error::unknown_variant(s, &["true", "false"])),
        }
    } else {
        Ok(false)
    }
}
