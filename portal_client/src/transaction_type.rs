#[derive(Debug, Default, Copy, Clone, PartialEq, Eq, glib::Enum)]
#[enum_type(name = "ApphubTransactionType")]
pub enum TransactionType {
    #[default]
    Install,
    Update,
    Uninstall,
}

impl From<dbus_types::TransactionType> for TransactionType {
    fn from(value: dbus_types::TransactionType) -> Self {
        match value {
            dbus_types::TransactionType::Install => TransactionType::Install,
            dbus_types::TransactionType::Uninstall => TransactionType::Uninstall,
            dbus_types::TransactionType::Update => TransactionType::Update,
        }
    }
}

impl Into<dbus_types::TransactionType> for TransactionType {
    fn into(self) -> dbus_types::TransactionType {
        match self {
            TransactionType::Install => dbus_types::TransactionType::Install,
            TransactionType::Uninstall => dbus_types::TransactionType::Uninstall,
            TransactionType::Update => dbus_types::TransactionType::Update,
        }
    }
}