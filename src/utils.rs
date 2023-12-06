use gtk::glib::once_cell::sync::Lazy;
use tokio::runtime::Runtime;

pub const APP_ID: &str = "dev.bedsteler20.AppHub";
pub static RUNTIME: Lazy<Runtime> =
    Lazy::new(|| Runtime::new().expect("Setting up tokio runtime needs to succeed."));

#[macro_export]
macro_rules! blueprint {
    ($struct_name:ident, $ui_file:expr) => {
        $struct_name::new(gtk::Builder::from_string(
            gtk::gtk4_macros::include_blueprint!($ui_file),
        ))
    };
}

#[derive(Clone)]
pub struct Context {
    pub window: adw::ApplicationWindow,
    pub app: adw::Application,
    pub transactions: crate::flatpak::TransactionChanel,
}

pub fn resource_path(path: &str) -> String {
    return format!("/dev/bedsteler20/Apphub/{}", path);
}

pub fn open_url(url: String) {
    RUNTIME.spawn(async move {
        if let Ok(url) = reqwest::Url::parse(&url) {
            if let Err(err) = ashpd::desktop::open_uri::OpenFileRequest::default()
                .ask(false)
                .send_uri(&url)
                .await
            {
                println!("Failed to open the url: {}", err);
            }
        }
    });
}
