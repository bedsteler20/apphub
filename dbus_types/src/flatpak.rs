use libflatpak::gio::Cancellable;

use crate::{InstallLocation, AppInfo};
use libflatpak::prelude::*;


impl Into<libflatpak::Installation> for InstallLocation {
    fn into(self) -> libflatpak::Installation {
        match self {
            InstallLocation::System => libflatpak::Installation::new_system(Cancellable::NONE)
                .expect("Failed to create system installation"),
            InstallLocation::User => libflatpak::Installation::new_user(Cancellable::NONE)
                .expect("Failed to create user installation"),
        }
    }
}

impl From<libflatpak::InstalledRef> for AppInfo {
    fn from(installed_ref: libflatpak::InstalledRef) -> Self {
        let pfx = std::env::var("XDG_DATA_HOME")
            .unwrap_or(format!("{}/.local/share", std::env::var("HOME").unwrap()));

        let install = if installed_ref.deploy_dir().unwrap().starts_with(&pfx) {
            InstallLocation::User
        } else {
            InstallLocation::System
        };

        let app_id = installed_ref.name().unwrap().to_string();
        let remote = installed_ref.origin().unwrap_or("".into()).to_string();

        Self {
            icon: get_icon_path(&install.into(), &app_id, &remote).unwrap_or("".to_string()),
            app_id: app_id,
            name: installed_ref
                .appdata_name()
                .unwrap_or(installed_ref.name().unwrap())
                .to_string(),
            from_flathub: remote.starts_with("flathub"),
            flatpak_ref: installed_ref.format_ref().unwrap().to_string(),
            install_location: install,
            summary: installed_ref
                .appdata_summary()
                .unwrap_or("".into())
                .to_string(),
        }
    }
}




pub fn get_icon_path(
    install: &libflatpak::Installation,
    app_id: &str,
    remote: &str,
) -> Option<String> {

    let install_path = install.path()?.path()?.to_str()?.to_string();
    let arch = libflatpak::default_arch()?;
    let icon_path = format!(
        "{}/appstream/{}/{}/active/icons/128x128/{}.png",
        install_path, remote, arch, app_id
    );
    if std::path::Path::new(&icon_path).exists() {
        return Some(icon_path);
    } else {
        return None;
    }
}