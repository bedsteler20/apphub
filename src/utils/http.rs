use http_cache_reqwest::{CACacheManager, Cache, CacheMode, HttpCache, HttpCacheOptions};
use once_cell::sync::OnceCell;
use reqwest_middleware::{ClientBuilder, ClientWithMiddleware};

use crate::utils::xdg_cache_home;

pub(crate) static CLIENT: OnceCell<ClientWithMiddleware> = OnceCell::new();

pub fn http() -> &'static ClientWithMiddleware {
    CLIENT.get().expect("apphub: client not configured")
}

pub fn configure_http() {
    let client = reqwest::Client::builder()
        .user_agent(format!(
            "{}/{}",
            crate::config::APP_ID,
            crate::config::APP_VERSION
        ))
        .build()
        .unwrap();
    let client = ClientBuilder::new(client)
        .with(Cache(HttpCache {
            mode: CacheMode::Default,
            manager: CACacheManager {
                path: std::path::PathBuf::from(xdg_cache_home()),
            },
            options: HttpCacheOptions::default(),
        }))
        .build();
    CLIENT.set(client).unwrap();
    flathub_rs::configure_client(http());
}
