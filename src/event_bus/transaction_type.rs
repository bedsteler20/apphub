use std::borrow::Cow;

use gtk::glib::{FromVariant, StaticVariantType, ToVariant, Variant, VariantTy, VariantType};

enum TransactionType {
    Install,
    Uninstall,
    Update,
}

impl ToVariant for TransactionType {
    fn to_variant(&self) -> Variant {
        match self {
            TransactionType::Install => Variant::from(0),
            TransactionType::Uninstall => Variant::from(1),
            TransactionType::Update => Variant::from(2),
        }
    }
}

impl From<Variant> for TransactionType {
    fn from(v: Variant) -> Self {
        match v.get::<i32>().unwrap() {
            0 => TransactionType::Install,
            1 => TransactionType::Uninstall,
            2 => TransactionType::Update,
            _ => panic!("Invalid transaction type"),
        }
    }
}

impl StaticVariantType for TransactionType {
    fn static_variant_type() -> Cow<'static, VariantTy> {
        VariantType::new("i").unwrap().into()
    }
}

impl FromVariant for TransactionType {
    fn from_variant(v: &Variant) -> Option<Self> {
        Some(TransactionType::from(v.clone()))
    }
}
