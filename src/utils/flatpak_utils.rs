use gio::Cancellable;
use libflatpak::prelude::*;

use crate::models::InstalledApp;
pub fn get_icon(
    app: &libflatpak::InstalledRef,
    install: &libflatpak::Installation,
) -> Option<String> {
    let install_path = install.path()?;
    let install_path = install_path.path()?;
    let install_path = install_path.to_str()?;
    let remote = app.origin()?.to_string();
    let arch = libflatpak::functions::default_arch()?.to_string();
    let app_id = app.name()?.to_string();
    let path =
        format!("{install_path}/appstream/{remote}/{arch}/active/icons/128x128/{app_id}.png",);
    if std::fs::metadata(&path).is_ok() {
        return Some(path);
    } else {
        return None;
    }
}

pub fn get_ref_path(app: &libflatpak::InstalledRef) -> String {
    let ty = match app.kind() {
        libflatpak::RefKind::Runtime => "runtime",
        libflatpak::RefKind::App => "app",
        _ => "",
    };
    let arch = libflatpak::functions::default_arch().unwrap();
    let branch = app.branch().unwrap();
    let app_id = app.name().unwrap();

    return format!("{ty}/{app_id}/{arch}/{branch}");
}

pub fn is_app_installed(app_id: &str) -> bool {
    let sys_install = libflatpak::Installation::new_system(Cancellable::NONE).unwrap();
    let user_install = libflatpak::Installation::new_user(Cancellable::NONE).unwrap();
    let user_apps = match user_install.list_installed_refs(Cancellable::NONE) {
        Ok(apps) => apps,
        Err(_) => {
            return false;
        }
    };
    let sys_apps = match sys_install.list_installed_refs(Cancellable::NONE) {
        Ok(apps) => apps,
        Err(_) => {
            return false;
        }
    };
    for app in user_apps {
        if app.name().unwrap() == app_id {
            return true;
        }
    }
    for app in sys_apps {
        if app.name().unwrap() == app_id {
            return true;
        }
    }
    return false;
}


pub fn get_installed_app(app_id: &str) -> Option<InstalledApp> {
    let sys_install = libflatpak::Installation::new_system(Cancellable::NONE).unwrap();
    let user_install = libflatpak::Installation::new_user(Cancellable::NONE).unwrap();
    let user_apps = match user_install.list_installed_refs(Cancellable::NONE) {
        Ok(apps) => apps,
        Err(_) => {
            return None;
        }
    };
    let sys_apps = match sys_install.list_installed_refs(Cancellable::NONE) {
        Ok(apps) => apps,
        Err(_) => {
            return None;
        }
    };
    for app in user_apps {
        if app.name().unwrap() == app_id {
            return Some(InstalledApp::from_flatpak(&app, &user_install));
        }
    }
    for app in sys_apps {
        if app.name().unwrap() == app_id {
            return Some(InstalledApp::from_flatpak(&app, &sys_install));
        }
    }
    return None;
}