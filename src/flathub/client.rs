use crate::prelude::*;
use flathub::{AppInfo, AppSummary, Query, QueryInfo};


fn get_client() -> Result<reqwest::Client, reqwest::Error> {
    return reqwest::Client::builder().build();
}

pub async fn query(options: Query, page: i32, per_page: i32) -> reqwest::Result<QueryInfo> {
    let client = get_client()?;
    let path = match options {
        Query::Popular => "popular/last-month",
        Query::RecentlyAdded => "collection/recently-added",
        Query::RecentlyUpdated => "collection/recently-updated",
    };
    let req = client
        .get(format!("{}/{}", BASE_URL, path))
        .query(&[("page", page), ("per_page", per_page)]);
    let response = req.send().await?;
    let query_info = response.json::<QueryInfo>().await?;
    return Ok(query_info);
}

pub async fn app_info(app_id: &str) -> reqwest::Result<AppInfo> {
    let client = get_client()?;
    let req = client.get(format!("{}/appstream/{}", BASE_URL, app_id));
    let response = req.send().await?;
    let app_info = response.json::<AppInfo>().await?;
    return Ok(app_info);
}

pub async fn app_summary(app_id: &str) -> reqwest::Result<AppSummary> {
    let client = get_client()?;
    let req = client.get(format!("{}/summary/{}", BASE_URL, app_id));
    let response = req.send().await?;
    let app_summary = response.json::<AppSummary>().await?;
    return Ok(app_summary);
}
