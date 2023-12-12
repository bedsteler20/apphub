use super::{app_info::InstalledAppInfo, helpers::get_icon_path, InstallLocation};
use crate::prelude::*;

pub fn process_ref(ref_: libflatpak::InstalledRef, install: InstallLocation) -> InstalledAppInfo {
    let app_id = ref_.name().unwrap();
    let name = ref_.appdata_name().unwrap_or(app_id.clone()).to_string();
    let app_id = app_id.to_string();
    let icon = get_icon_path(
        &install.to_flatpak(Cancellable::NONE).unwrap(),
        &app_id,
        ref_.origin().unwrap_or_default().as_str(),
    );
    let from_flathub = ref_.origin().unwrap_or_default().to_string() == "flathub";
    let app = InstalledAppInfo {
        app_id,
        name,
        icon,
        from_flathub,
        install_location: install,
        branch: ref_.branch().unwrap_or_default().to_string(),
        arch: ref_.arch().unwrap_or_default().to_string(),
        subpaths: ref_
            .subpaths()
            .to_vec()
            .iter()
            .map(|x| x.to_string())
            .collect(),
        is_runtime: ref_.kind() == libflatpak::RefKind::Runtime,
    };
    return app;
}

pub fn is_app_installed(app_id: &str) -> Result<bool, glib::Error> {
    let sys_install = libflatpak::Installation::new_system(Cancellable::NONE)?;
    let user_install = libflatpak::Installation::new_user(Cancellable::NONE)?;
    for r in sys_install.list_installed_refs(Cancellable::NONE)? {
        if let Some(id) = r.name() {
            if id.to_string() == app_id.to_owned() {
                return Ok(true);
            }
        }
    }

    for r in user_install.list_installed_refs(Cancellable::NONE)? {
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

    let sys_install = libflatpak::Installation::new_system(Cancellable::NONE)?;
    let user_install = libflatpak::Installation::new_user(Cancellable::NONE)?;
    let sys_refs = sys_install.list_installed_refs(Cancellable::NONE)?;
    let user_refs = user_install.list_installed_refs(Cancellable::NONE)?;
    for r in sys_refs {
        apps.push(process_ref(r, InstallLocation::System));
    }
    for r in user_refs {
        apps.push(process_ref(r, InstallLocation::User));
    }

    return Ok(apps);
}

pub fn get_installed_app(app_id: &str) -> Option<InstalledAppInfo> {
    if let Ok(apps) = list_installed_apps() {
        for app in apps {
            if app.app_id == app_id {
                return Some(app);
            }
        }
    }
    return None;
}

pub fn open_app(app_id: &str) {
    let _ = std::process::Command::new("flatpak")
        .arg("run")
        .arg(app_id)
        .spawn();
}
