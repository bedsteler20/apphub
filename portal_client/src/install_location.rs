#[derive(Debug, Default, Copy, Clone, PartialEq, Eq, glib::Enum)]
#[enum_type(name = "ApphubInstallLocation")]
pub enum InstallLocation {
    #[default]
    System,
    User,
}

impl From<dbus_types::InstallLocation> for InstallLocation {
    fn from(value: dbus_types::InstallLocation) -> Self {
        match value {
            dbus_types::InstallLocation::System => InstallLocation::System,
            dbus_types::InstallLocation::User => InstallLocation::User,
        }
    }
}

impl Into<dbus_types::InstallLocation> for InstallLocation {
    fn into(self) -> dbus_types::InstallLocation {
        match self {
            InstallLocation::System => dbus_types::InstallLocation::System,
            InstallLocation::User => dbus_types::InstallLocation::User,
        }
    }
}