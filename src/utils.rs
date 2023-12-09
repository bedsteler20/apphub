use crate::prelude::*;

use tokio::runtime::Runtime;

pub const APP_ID: &str = "dev.bedsteler20.AppHub";
pub const RESOURCE_PATH: &str = "/dev/bedsteler20/Apphub";
pub const BASE_URL: &str = "https://flathub.org/api/v2";
pub const REF_BASE_URL: &str = "https://dl.flathub.org/repo/appstream/";
#[allow(non_upper_case_globals)]
pub static runtime: OnceCell<Runtime> = OnceCell::new(|| {
    Runtime::new().expect(tr!("Setting up tokio runtime needs to succeed.").as_str())
});

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
}

pub fn open_url(url: String) {
    runtime.spawn(async move {
        if let Ok(url) = reqwest::Url::parse(&url) {
            if let Err(err) = ashpd::desktop::open_uri::OpenFileRequest::default()
                .ask(false)
                .send_uri(&url)
                .await
            {
                println!("{}: {}", tr!("Failed to open the url"), err);
            }
        }
    });
}
