use libflatpak::glib;
use serde::{Deserialize, Serialize};

#[cfg(feature = "libflatpak")]
mod flatpak;
#[cfg(feature = "libflatpak")]
pub use flatpak::*;

#[derive(Debug, zvariant::Type, Serialize, Deserialize)]
pub struct AppInfo {
    pub app_id: String,
    pub name: String,
    pub from_flathub: bool,
    pub icon: String,
    pub install_location: InstallLocation,
    pub flatpak_ref: String,
    pub summary: String,
}

#[derive(Debug, zvariant::Type, Serialize, Deserialize, Clone, Copy)]
pub enum InstallLocation {
    System,
    User,
}

#[derive(Clone, Debug, serde::Serialize, serde::Deserialize, zvariant::Type)]
pub struct Transaction {
    pub id: u32,
    pub app_id: String,
    pub progress: f64,
    pub error: String,
    pub done: bool,
    pub install_location: InstallLocation,
    pub transaction_type: TransactionType,
}

impl Transaction {
    pub fn new(
        app_id: &str,
        install_location: InstallLocation,
        transaction_type: TransactionType,
    ) -> Self {
        Self {
            id: glib::random_int(),
            app_id: app_id.into(),
            progress: 0.0,
            error: "".into(),
            done: false,
            install_location,
            transaction_type,
        }
    }
}

#[derive(Clone, Debug, PartialEq, Eq, serde::Serialize, Deserialize, zvariant::Type)]
pub enum TransactionType {
    Install,
    Uninstall,
    Update,
}
