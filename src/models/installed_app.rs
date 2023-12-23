use crate::models::InstallLocation;
use crate::utils::Sendable;
use crate::utils::flatpak_utils::get_icon;
use crate::utils::flatpak_utils::get_ref_path;
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
        pub summary: RefCell<Option<String>>,
        #[property(get, set, builder(InstallLocation::System))]
        pub install_location: Cell<InstallLocation>,
        #[property(get, set)]
        pub icon: RefCell<Option<String>>,
        #[property(get, set)]
        pub ref_path: RefCell<String>,
        #[property(get, set)]
        pub remote: RefCell<String>,
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
        summary: Option<String>,
        install_location: InstallLocation,
        icon: Option<String>,
        ref_path: String,
        remote: String,
    ) -> Self {
        glib::Object::builder()
            .property("name", &name)
            .property("app-id", &app_id)
            .property("summary", &summary)
            .property("install-location", &install_location)
            .property("icon", &icon)
            .property("ref-path", &ref_path)
            .property("remote", &remote)
            .build()
    }

    pub fn from_flatpak(
        app: &libflatpak::InstalledRef,
        install_location: &libflatpak::Installation,
    ) -> Self {
        let app_id = app.name().unwrap();
        let name = app.appdata_name().unwrap_or(app_id.clone());
        let summary = app.appdata_summary().and_then(|s| Some(s.to_string()));
        let icon = get_icon(&app, &install_location);
        let remote = app.origin().unwrap().to_string();
        let install_location = match install_location.is_user() {
            true => InstallLocation::User,
            false => InstallLocation::System,
        };
        let ref_path = get_ref_path(&app);

        Self::new(
            app_id.to_string(),
            name.to_string(),
            summary,
            install_location,
            icon,
            ref_path,
            remote,
        )
    }
}

pub type InstalledAppSendable = (
    String,
    String,
    Option<String>,
    InstallLocation,
    Option<String>,
    String,
    String
);

impl Sendable for InstalledApp {
    type SendableType = InstalledAppSendable;

    fn to_sendable(&self) -> Self::SendableType {
        (
            self.app_id().clone(),
            self.name().clone(),
            self.summary().clone(),
            self.install_location(),
            self.icon().clone(),
            self.ref_path().clone(),
            self.remote().clone(),
        )
    }

    fn from_sendable(sendable: Self::SendableType) -> Self {
        Self::new(
            sendable.0,
            sendable.1,
            sendable.2,
            sendable.3,
            sendable.4,
            sendable.5,
            sendable.6,
        )
    }
}