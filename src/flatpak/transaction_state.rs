use std::borrow::Cow;

use gtk::glib::{FromVariant, StaticVariantType, ToVariant, Variant, VariantTy, VariantType};

// ANCHOR: transaction_type
pub enum TransactionType {
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

impl From<i32> for TransactionType {
    fn from(i: i32) -> Self {
        match i {
            0 => TransactionType::Install,
            1 => TransactionType::Uninstall,
            2 => TransactionType::Update,
            _ => panic!("Invalid transaction type"),
        }
    }
}

// ANCHOR_END: transaction_type

// ANCHOR: transaction_state

pub enum TransactionState {
    Start {
        app_id: String,
        type_: TransactionType,
    },
    Progress {
        app_id: String,
        progress: f64,
        type_: TransactionType,
    },
    Done {
        app_id: String,
        type_: TransactionType,
    },
    Error {
        app_id: String,
        type_: TransactionType,
        error: String,
    },
    Cancel {
        app_id: String,
        type_: TransactionType,
    },
}

impl TransactionState {
    pub fn app_id(&self) -> &String {
        match self {
            TransactionState::Start { app_id, .. } => app_id,
            TransactionState::Progress { app_id, .. } => app_id,
            TransactionState::Done { app_id, .. } => app_id,
            TransactionState::Error { app_id, .. } => app_id,
            TransactionState::Cancel { app_id, .. } => app_id,
        }
    }

    pub fn type_(&self) -> &TransactionType {
        match self {
            TransactionState::Start { type_, .. } => type_,
            TransactionState::Progress { type_, .. } => type_,
            TransactionState::Done { type_, .. } => type_,
            TransactionState::Error { type_, .. } => type_,
            TransactionState::Cancel { type_, .. } => type_,
        }
    }
}

impl From<Variant> for TransactionState {
    fn from(v: Variant) -> Self {
        let (i, app_id, progress, type_) = v.get::<(i32, String, f64, i32)>().unwrap();
        match i {
            0 => TransactionState::Start {
                app_id,
                type_: type_.into(),
            },
            1 => TransactionState::Progress {
                app_id,
                progress,
                type_: type_.into(),
            },
            2 => TransactionState::Done {
                app_id,
                type_: type_.into(),
            },
            _ => panic!("Invalid transaction state"),
        }
    }
}

impl StaticVariantType for TransactionState {
    fn static_variant_type() -> Cow<'static, VariantTy> {
        // cspell:ignore isdis
        VariantType::new("(isdis)").unwrap().into()
    }
}

impl FromVariant for TransactionState {
    fn from_variant(v: &Variant) -> Option<Self> {
        Some(TransactionState::from(v.clone()))
    }
}

impl ToVariant for TransactionState {
    fn to_variant(&self) -> Variant {
        match self {
            TransactionState::Start { app_id, type_ } => {
                Variant::from((0, app_id.clone(), 0.0, type_.to_variant(), ""))
            }
            TransactionState::Progress {
                app_id,
                progress,
                type_,
            } => Variant::from((1, app_id.clone(), *progress, type_.to_variant(), "")),
            TransactionState::Done { app_id, type_ } => {
                Variant::from((2, app_id.clone(), 0.0, type_.to_variant(), ""))
            },
            TransactionState::Error { app_id, type_, error } => {
                Variant::from((3, app_id.clone(), 0.0, type_.to_variant(), error))
            },
            TransactionState::Cancel { app_id, type_ } => {
                Variant::from((4, app_id.clone(), 0.0, type_.to_variant(), ""))
            },
        }
    }
}

// ANCHOR_END: transaction_state

