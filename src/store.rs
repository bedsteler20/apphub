use crate::prelude::*;

// ======== TransactionStore ========
#[derive(Debug, Clone)]
pub struct TransactionStore {
    inner: Rc<Vec<Transaction>>,
    emitter: gio::SimpleAction,
}

impl TransactionStore {
    pub fn new() -> Self {
        Self {
            inner: Rc::new(Vec::new()),
            emitter: gio::SimpleAction::new(
                "transaction",
                Some(glib::VariantTy::new("s").unwrap()),
            ),
        }
    }

    pub fn get(&self, app_id: &str) -> Option<Transaction> {
        self.inner.iter().find(|t| t.app_id == app_id).cloned()
    }

    pub fn subscribe(&self, app_id: &str, f: Rc<dyn Fn(&Transaction)>) -> SignalHandlerIdWrapper {
        let transactions = Rc::clone(&self.inner);
        let app_id = app_id.to_string();

        let id = self
            .emitter
            .connect_activate(move |_, args: Option<&glib::Variant>| {
                let arg_app_id = args.unwrap().get::<String>().unwrap();
                if arg_app_id == app_id {
                    let transaction = transactions.iter().find(|t| t.app_id == app_id);
                    if let Some(transaction) = transaction {
                        f(transaction);
                    }
                }
            });

        SignalHandlerIdWrapper::new(id)
    }

    pub fn unsubscribe(&self, id: SignalHandlerIdWrapper) {
        self.emitter.disconnect(id.into());
    }

    pub fn iter(&self) -> impl Iterator<Item = &Transaction> {
        self.inner.iter()
    }
}

impl From<TransactionStore> for Vec<Transaction> {
    fn from(s: TransactionStore) -> Self {
        s.inner.as_ref().clone()
    }
}

impl From<Vec<Transaction>> for TransactionStore {
    fn from(v: Vec<Transaction>) -> Self {
        Self {
            inner: Rc::new(v),
            emitter: gio::SimpleAction::new(
                "transaction",
                Some(glib::VariantTy::new("s").unwrap()),
            ),
        }
    }
}

// ======== Transaction ========

#[derive(Debug, Clone)]
pub struct Transaction {
    pub app_id: String,
    pub progress: f64,
}

// ======== TransactionContainer ========

#[derive(Debug, Clone)]
struct TransactionContainer {
    emitter: gio::SimpleAction,
    inner: Rc<Transaction>,
}

impl TransactionContainer {
    pub fn new(inner: Transaction) -> Self {
        Self {
            emitter: gio::SimpleAction::new("transaction", None),
            inner: Rc::new(inner),
        }
    }

    pub fn emit(&self) {
        self.emitter.activate(None);
    }

    pub fn subscribe(&self, f: Rc<dyn Fn(&Transaction)>) -> SignalHandlerIdWrapper {
        let transaction = Rc::clone(&self.inner);
        let id = self.emitter.connect_activate(move |_, _| {
            f(&transaction);
        });

        SignalHandlerIdWrapper::new(id)
    }

    pub fn unsubscribe(&self, id: SignalHandlerIdWrapper) {
        self.emitter.disconnect(id.into());
    }

    pub fn app_id(&self) -> &String {
        &self.inner.app_id
    }

    pub fn progress(&self) -> f64 {
        self.inner.progress
    }
}

impl From<TransactionContainer> for Transaction {
    fn from(c: TransactionContainer) -> Self {
        c.inner.as_ref().clone()
    }
}

impl From<Transaction> for TransactionContainer {
    fn from(t: Transaction) -> Self {
        Self::new(t)
    }
}

// ======== SignalHandlerIdWrapper ========

pub struct SignalHandlerIdWrapper(glib::SignalHandlerId);

impl SignalHandlerIdWrapper {
    pub fn new(id: glib::SignalHandlerId) -> Self {
        SignalHandlerIdWrapper(id)
    }
}

impl Clone for SignalHandlerIdWrapper {
    fn clone(&self) -> Self {
        unsafe {
            let c = self.0.as_raw();
            SignalHandlerIdWrapper::new(glib::SignalHandlerId::from_glib(c))
        }
    }
}

impl From<SignalHandlerIdWrapper> for glib::SignalHandlerId {
    fn from(id: SignalHandlerIdWrapper) -> Self {
        id.0
    }
}

impl Into<SignalHandlerIdWrapper> for glib::SignalHandlerId {
    fn into(self) -> SignalHandlerIdWrapper {
        SignalHandlerIdWrapper::new(self)
    }
}
