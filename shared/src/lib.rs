use once_cell::sync::Lazy;
use tokio::runtime::Runtime;
pub static RUNTIME: Lazy<Runtime> = Lazy::new(|| Runtime::new().unwrap());

pub fn in_flatpak() -> bool {
    std::env::var("FLATPAK_ID").is_ok()
}