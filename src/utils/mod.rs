use tokio::runtime::Runtime;
mod transaction_runner;
mod call_me_maybe;
mod xdg;

pub static RUNTIME: once_cell::sync::Lazy<Runtime> =
    once_cell::sync::Lazy::new(|| tokio::runtime::Runtime::new().unwrap());

pub use transaction_runner::run_transaction;
pub use call_me_maybe::call_me_maybe;
pub use xdg::xdg_open;