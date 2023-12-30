use crate::config::APP_ID;

pub fn xdg_open(url: &str) {
    glib::spawn_command_line_async(format!("xdg-open {}", url).as_str()).unwrap();
}

pub fn xdg_cache_home() -> String {
    let xdg_cache_home = std::env::var("XDG_CACHE_HOME").unwrap_or_else(|_| {
        let home = std::env::var("HOME").unwrap();
        format!("{}/.cache", home)
    });
    format!("{}/{}", xdg_cache_home, APP_ID)
}