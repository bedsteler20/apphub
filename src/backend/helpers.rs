use super::installation::InstallLocation;
use crate::prelude::*;

const REF_BASE_URL: &str = "https://dl.flathub.org/repo/appstream/";

pub fn get_installed_refs() -> Result<Vec<(InstallLocation, libflatpak::InstalledRef)>, glib::Error>
{
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


pub fn get_progress(
    transaction: &libflatpak::Transaction,
    operation: &libflatpak::TransactionOperation,
    progress: &libflatpak::TransactionProgress,
) -> f64 {
    let total = transaction
        .operations()
        .iter()
        .fold(0, |acc, x| acc + x.installed_size() + x.download_size());
    let install_size = operation.installed_size() + operation.download_size();
    let bytes_transferred =
        install_size as f64 - (install_size as f64 / progress.progress() as f64);
    let prev_ops_size = transaction
        .operations()
        .iter()
        .take_while(|x| x.to_owned() != operation)
        .fold(0, |acc, x| acc + x.installed_size() + x.download_size());

    let weight = (prev_ops_size as f64 + bytes_transferred) / total as f64;
    return weight;
}

pub fn get_flatpak_ref(app_id: &str) -> reqwest::Result<glib::Bytes> {
    let bytes = reqwest::blocking::get(&format!("{}/{}.flatpakref", REF_BASE_URL, app_id))?;
    let bytes = bytes.bytes()?;
    let bytes = glib::Bytes::from(&bytes);
    return Ok(bytes);
}
