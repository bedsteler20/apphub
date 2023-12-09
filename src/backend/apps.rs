use crate::prelude::*;
use super::helpers::{get_installed_refs, get_icon_path};


#[derive(Debug, Clone)]
pub struct InstalledAppInfo {
    pub app_id: String,
    pub name: String,
    pub icon: Option<String>,
    pub from_flathub: bool,
}


pub fn is_app_installed(app_id: &String) -> Result<bool, glib::Error> {
    let refs = get_installed_refs()?;
    for (_, r) in refs {
        if let Some(id) = r.name() {
            if id.to_string() == app_id.to_owned() {
                return Ok(true);
            }
        }
    }

    return Ok(false);
}

pub fn list_installed_apps() -> Result<Vec<InstalledAppInfo>, glib::Error> {
    let mut apps: Vec<InstalledAppInfo> = Vec::new();

    let refs = get_installed_refs()?;
    for (install, r) in refs {
        if let Some(id) = r.name() {
            let app_id = id.to_string();
            let name = r.appdata_name().unwrap_or(id.clone()).to_string();
            let icon = get_icon_path(
                &install.to_flatpak(Cancellable::NONE)?,
                &id.to_string(),
                r.origin().unwrap_or_default().as_str(),
            );
            let from_flathub = r.origin().unwrap_or_default().to_string() == "flathub";
            let app = InstalledAppInfo {
                app_id,
                name,
                icon,
                from_flathub,
            };
            apps.push(app);
        }
    }

    return Ok(apps);
}

pub fn open_app(app_id: &str) {
    let _ = std::process::Command::new("flatpak")
        .arg("run")
        .arg(app_id)
        .spawn();
}
