use crate::prelude::*;

// ======== Data Structs ========
pub enum InstallLocation {
    System,
    User,
}

impl Into<libflatpak::Installation> for InstallLocation {
    fn into(self) -> libflatpak::Installation {
        match self {
            InstallLocation::System => {
                libflatpak::Installation::new_system(Cancellable::NONE).unwrap()
            }
            InstallLocation::User => libflatpak::Installation::new_user(Cancellable::NONE).unwrap(),
        }
    }
}

#[derive(Debug, Clone)]
pub struct InstalledAppInfo {
    pub app_id: String,
    pub name: String,
    pub icon: Option<String>,
    pub from_flathub: bool,
}

// ======== API Functions ========

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
                &install.into(),
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

// ======== Helpers ========

fn get_installed_refs() -> Result<Vec<(InstallLocation, libflatpak::InstalledRef)>, glib::Error> {
    let cancel = gio::Cancellable::new();
    let sys_install = libflatpak::Installation::new_system(Some(&cancel))?;
    let user_install = libflatpak::Installation::new_user(Some(&cancel))?;

    let mut refs: Vec<(InstallLocation, libflatpak::InstalledRef)> = Vec::new();
    let sys_refs = sys_install.list_installed_refs(Some(&cancel))?;
    for r in sys_refs {
        refs.push((InstallLocation::System, r));
    }
    let user_refs = user_install.list_installed_refs(Some(&cancel))?;
    for r in user_refs {
        refs.push((InstallLocation::User, r));
    }

    return Ok(refs);
}

fn get_icon_path(install: &libflatpak::Installation, app_id: &str, remote: &str) -> Option<String> {
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
