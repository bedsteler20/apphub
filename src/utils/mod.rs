use glib::IsA;
use tokio::runtime::Runtime;
mod call_me_maybe;
mod http;
mod sendable;
mod transaction_runner;
mod xdg;
pub use http::configure_http;
pub use http::http;

pub mod flatpak_utils;
pub static RUNTIME: once_cell::sync::Lazy<Runtime> =
    once_cell::sync::Lazy::new(|| tokio::runtime::Runtime::new().unwrap());

pub use call_me_maybe::call_me_maybe;
pub use sendable::Sendable;
pub use transaction_runner::run_transaction;
pub use xdg::xdg_open;
pub use xdg::xdg_cache_home;


/// Trait for finding a resource.
pub trait Findable {
    fn find() -> Self;
}


