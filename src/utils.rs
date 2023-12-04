use gtk::glib::{self, clone, once_cell::sync::Lazy};
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
