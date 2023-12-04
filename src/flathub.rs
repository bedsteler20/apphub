use serde::{de, Deserialize};

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
    pub id: String,
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





// pub async fn popular() -> Result<QueryInfo, Box<dyn std::error::Error>> {
//     let client = reqwest::Client::new();
//     let resp = client
//         .get("https://flathub.org/api/v2/popular/last-month")
//         .query(&[("page", "1"), ("per_page", "10")])
//         .send()
//         .await?
//         .json::<QueryInfo>()
//         .await?;
//     Ok(resp)


fn deserialize_bool<'de, D>(deserializer: D) -> Result<bool, D::Error>
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
