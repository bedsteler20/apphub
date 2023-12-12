use super::InstallLocation;

use gtk::glib::subclass::{object::ObjectImpl, types::ObjectSubclass};

use crate::prelude::*;
use glib::subclass::prelude::*;

#[derive(Debug, Clone)]
pub struct InstalledAppInfo {
    pub app_id: String,
    pub name: String,
    pub icon: Option<String>,
    pub from_flathub: bool,
    pub install_location: InstallLocation,
    pub branch: String,
    pub arch: String,
    pub subpaths: Vec<String>,
    pub is_runtime: bool,
}

impl InstalledAppInfo {
    pub fn app_path(&self) -> String {
        let ty = match self.is_runtime {
            true => "runtime",
            false => "app",
        };
        return  format!(
            "{}/{}/{}/{}",
            ty, self.app_id, self.arch, self.branch, 
        );
    }
}

#[derive(Default, glib::Properties)]
#[properties(wrapper_type = GInstalledAppInfo)]
pub struct GInstalledAppInfoPrivate {
    #[property(get, construct_only)]
    app_id: RefCell<String>,
    #[property(get, construct_only)]
    name: RefCell<String>,
    #[property(get, construct_only)]
    icon: RefCell<Option<String>>,
    #[property(get, construct_only)]
    from_flathub: RefCell<bool>,
    #[property(get, construct_only)]
    install_location: RefCell<i32>,
    #[property(get, construct_only)]
    branch: RefCell<String>,
    #[property(get, construct_only)]
    arch: RefCell<String>,
    #[property(get, construct_only)]
    subpaths: RefCell<Vec<String>>,
    #[property(get, construct_only)]
    is_runtime: RefCell<bool>,
}

#[glib::object_subclass]
impl ObjectSubclass for GInstalledAppInfoPrivate {
    const NAME: &'static str = "GInstalledAppInfo";
    type Type = GInstalledAppInfo;
}

#[glib::derived_properties]
impl ObjectImpl for GInstalledAppInfoPrivate {}

glib::wrapper! {
    pub struct GInstalledAppInfo(ObjectSubclass<GInstalledAppInfoPrivate>);
}

impl GInstalledAppInfo {
    pub fn new(
        app_id: &str,
        name: &str,
        icon: Option<&str>,
        from_flathub: bool,
        install_location: InstallLocation,
        branch: &str,
        is_runtime: bool,
        #[allow(unused)]
        subpaths: Vec<&str>,
        arch: &str,
    ) -> GInstalledAppInfo {
        glib::Object::builder()
            .property("app-id", app_id)
            .property("name", name)
            .property("icon", icon)
            .property("from-flathub", from_flathub)
            .property("install-location", Into::<i32>::into(install_location))
            .property("branch", branch)
            .property("is-runtime", is_runtime)
            .property("arch", arch)
            .build()
    }
}

impl From<InstalledAppInfo> for GInstalledAppInfo {
    fn from(app: InstalledAppInfo) -> Self {
        Self::new(
            &app.app_id,
            &app.name,
            app.icon.as_deref(),
            app.from_flathub,
            app.install_location,
            &app.branch,
            app.is_runtime,
            app.subpaths.iter().map(|x| x.as_str()).collect(),
            &app.arch,
        )
    }
}

impl From<&InstalledAppInfo> for GInstalledAppInfo {
    fn from(app: &InstalledAppInfo) -> Self {
        Self::new(
            &app.app_id,
            &app.name,
            app.icon.as_deref(),
            app.from_flathub,
            app.install_location,
            &app.branch,
            app.is_runtime,
            app.subpaths.iter().map(|x| x.as_str()).collect(),
            &app.arch,
        )
    }
}

impl From<&GInstalledAppInfo> for InstalledAppInfo {
    fn from(app: &GInstalledAppInfo) -> Self {
        Self {
            app_id: app.app_id().to_string(),
            name: app.name().to_string(),
            icon: app.icon(),
            from_flathub: app.from_flathub(),
            install_location: app.install_location().into(),
            branch: app.branch().to_string(),
            arch: app.arch().to_string(),
            subpaths: app.subpaths().to_vec(),
            is_runtime: app.is_runtime(),
        }
    }
}

impl From<GInstalledAppInfo> for InstalledAppInfo {
    fn from(app: GInstalledAppInfo) -> Self {
        Self {
            app_id: app.app_id().to_string(),
            name: app.name().to_string(),
            icon: app.icon(),
            from_flathub: app.from_flathub(),
            install_location: app.install_location().into(),
            branch: app.branch().to_string(),
            arch: app.arch().to_string(),
            subpaths: app.subpaths().to_vec(),
            is_runtime: app.is_runtime(),
        }
    }
}
