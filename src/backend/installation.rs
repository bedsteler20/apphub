use crate::prelude::*;

#[derive(Debug, Clone, Copy)]
pub enum InstallLocation {
    System,
    User,
}
impl InstallLocation {
    pub fn to_flatpak(
        &self,
        cancellable: Option<&Cancellable>,
    ) -> Result<libflatpak::Installation, glib::Error> {
        match self {
            InstallLocation::System => libflatpak::Installation::new_system(cancellable),
            InstallLocation::User => libflatpak::Installation::new_user(cancellable),
        }
    }
}

impl Default for InstallLocation {
    fn default() -> Self {
        InstallLocation::System
    }
}

impl From<i32> for InstallLocation {
    fn from(i: i32) -> Self {
        match i {
            0 => InstallLocation::System,
            1 => InstallLocation::User,
            _ => InstallLocation::System,
        }
    }
}

impl From<InstallLocation> for i32 {
    fn from(i: InstallLocation) -> Self {
        match i {
            InstallLocation::System => 0,
            InstallLocation::User => 1,
        }
    }
}
