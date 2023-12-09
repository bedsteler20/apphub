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
