use crate::prelude::*;

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
