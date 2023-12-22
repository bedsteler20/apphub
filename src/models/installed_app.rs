use crate::models::InstallLocation;
use glib::prelude::*;
use glib::subclass::prelude::*;
use libflatpak::prelude::*;
use std::cell::Cell;
use std::cell::RefCell;
mod imp {

    use super::*;

    #[derive(Debug, Default, glib::Properties)]
    #[properties(wrapper_type = super::InstalledApp)]
    pub struct InstalledApp {
        #[property(get, set)]
        pub app_id: RefCell<String>,
        #[property(get, set)]
        pub name: RefCell<String>,
        #[property(get, set)]
        pub summary: RefCell<String>,
        #[property(get, set, builder(InstallLocation::System))]
        pub install_location: Cell<InstallLocation>,
        #[property(get, set)]
        pub icon: RefCell<Option<String>>,
        #[property(get, set)]
        pub ref_path: RefCell<String>,
    }

    #[glib::object_subclass]
    impl ObjectSubclass for InstalledApp {
        const NAME: &'static str = "InstalledApp";
        type Type = super::InstalledApp;
    }

    #[glib::derived_properties]
    impl ObjectImpl for InstalledApp {}
}

glib::wrapper! {
    pub struct InstalledApp(ObjectSubclass<imp::InstalledApp>);
}

impl InstalledApp {
    pub fn new(
        app_id: String,
        name: String,
        summary: String,
        install_location: InstallLocation,
        icon: Option<String>,
        ref_path: String,
    ) -> Self {
        glib::Object::builder()
            .property("name", &name)
            .property("app-id", &app_id)
            .property("summary", &summary)
            .property("install-location", &install_location)
            .property("icon", &icon)
            .property("ref-path", &ref_path)
            .build()
    }

    pub fn from_glib(app: libflatpak::InstalledRef)
}

// ================================================================================

pub struct InstalledAppSendable {
    app_id: String,
    name: String,
    summary: String,
    install_location: InstallLocation,
    icon: Option<String>,
    ref_path: String,
}

impl From<InstalledApp> for InstalledAppSendable {
    fn from(app: InstalledApp) -> Self {
        Self {
            app_id: app.app_id(),
            name: app.name(),
            summary: app.summary(),
            install_location: app.install_location(),
            icon: app.icon(),
            ref_path: app.ref_path(),
        }
    }
}

impl From<InstalledAppSendable> for InstalledApp {
    fn from(app: InstalledAppSendable) -> Self {
        Self::new(
            app.app_id,
            app.name,
            app.summary,
            app.install_location,
            app.icon,
            app.ref_path,
        )
    }
}

// ================================================================================

