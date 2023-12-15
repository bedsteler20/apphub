#[derive(Debug, Default, Copy, Clone, PartialEq, Eq, glib::Enum)]
#[enum_type(name = "ApphubTransactionType")]
pub enum ApphubTransactionType {
    #[default]
    Install,
    Update,
    Uninstall,
}
