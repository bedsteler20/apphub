#[zbus::dbus_proxy(
    interface = "dev.bedsteler20.Apphub.Portal",
    default_service = "dev.bedsteler20.Apphub.Portal",
    default_path = "/dev/bedsteler20/Apphub/Portal"
)]
trait ApphubPortal {
    fn list_transactions(&self) -> zbus::Result<Vec<dbus_types::Transaction>>;
    fn get_transaction(&self, transaction_id: u32) -> zbus::Result<dbus_types::Transaction>;
    fn get_app_info(&self, app_id: &str) -> zbus::Result<dbus_types::AppInfo>;
    fn is_app_installed(&self, app_id: &str) -> zbus::Result<bool>;
    fn apps_with_updates(&self) -> zbus::Result<Vec<dbus_types::AppInfo>>;

    fn create_transaction(
        &self,
        app_id: &str,
        install_location: dbus_types::InstallLocation,
        transaction_type: dbus_types::TransactionType,
    ) -> zbus::Result<u32>;

    fn install(&self, transaction_id: u32) -> zbus::Result<()>;
    fn uninstall(&self, transaction_id: u32) -> zbus::Result<()>;
    fn update(&self, transaction_id: u32) -> zbus::Result<()>;
    #[dbus_proxy(signal)]
    fn progress_changed(&self, transaction_id: u32, progress: f64) -> zbus::Result<()>;

    #[dbus_proxy(signal)]
    fn transaction_added(&self, transaction: dbus_types::Transaction) -> zbus::Result<()>;

    #[dbus_proxy(signal)]
    fn transaction_error(&self, transaction_id: u32, error: String) -> zbus::Result<()>;

    #[dbus_proxy(signal)]
    fn transaction_done(&self, transaction_id: u32) -> zbus::Result<()>;
}

