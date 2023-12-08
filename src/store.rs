use crate::prelude::*;

// ======== TransactionStore ========
#[derive(Debug, Clone)]
pub struct TransactionStore {
    inner: Rc<RefCell<Vec<Transaction>>>,
    emitter: gio::SimpleAction,
}

impl TransactionStore {
    pub fn new() -> Self {
        Self {
            inner: Rc::new(RefCell::new(Vec::new())),
            emitter: gio::SimpleAction::new(
                "transaction",
                Some(glib::VariantTy::new("s").unwrap()),
            ),
        }
    }

    pub fn get(&self, app_id: &str) -> Option<Transaction> {
        self.inner
            .borrow()
            .iter()
            .find(|t| t.app_id == app_id)
            .cloned()
    }

    pub fn subscribe(&self, app_id: &str, f: Rc<dyn Fn(Transaction)>) -> glib::SignalHandlerId {
        let transactions = Rc::clone(&self.inner);
        let app_id = app_id.to_string();

        let id = self
            .emitter
            .connect_activate(move |_, args: Option<&glib::Variant>| {
                let arg_app_id = args.unwrap().get::<String>().unwrap();
                if arg_app_id == app_id {
                    let transaction = transactions
                        .clone()
                        .borrow()
                        .iter()
                        .find(|t| t.app_id == app_id)
                        .cloned();
                    if let Some(transaction) = transaction {
                        f(transaction);
                    }
                }
            });

        id
    }

    pub fn unsubscribe(&self, id: SignalHandlerId) {
        self.emitter.disconnect(id);
    }

    pub fn add(&self, transaction: Transaction) {
        self.inner.borrow_mut().push(transaction.clone());
        self.emitter
            .activate(Some(&glib::Variant::from(&transaction.app_id)));
    }

    pub fn remove(&self, app_id: &str) {
        let mut transactions = self.inner.borrow_mut();
        let index = transactions
            .iter()
            .position(|t| t.app_id == app_id)
            .unwrap_or_default();
        transactions.remove(index);
    }

    pub fn update(&self, transaction: Transaction) {
        let mut transactions = self.inner.borrow_mut();
        let index = transactions
            .iter()
            .position(|t| t.app_id == transaction.app_id)
            .unwrap_or_default();
        transactions[index] = transaction.clone();
        self.emitter
            .activate(Some(&glib::Variant::from(&transaction.app_id)));
    }

}

impl From<TransactionStore> for Vec<Transaction> {
    fn from(s: TransactionStore) -> Self {
        s.inner.borrow().clone()
    }
}

impl From<Vec<Transaction>> for TransactionStore {
    fn from(v: Vec<Transaction>) -> Self {
        Self {
            inner: Rc::new(RefCell::new(v)),
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
    pub state: TransactionState,
    pub stage: TransactionStage,
    pub error: Option<String>,
    pub canaled: bool,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub enum TransactionStage {
    Start,
    Progress,
    End,
}

#[derive(Debug, Clone)]
#[allow(unused)]
pub enum TransactionState {
    Install,
    Uninstall,
    Update,
}

// ======== TransactionContainer ========

#[derive(Debug, Clone)]
struct TransactionContainer {
    emitter: gio::SimpleAction,
    inner: Rc<RefCell<Transaction>>,
}

impl TransactionContainer {
    pub fn new(inner: Transaction) -> Self {
        Self {
            emitter: gio::SimpleAction::new("transaction", None),
            inner: Rc::new(RefCell::new(inner)),
        }
    }

    pub fn emit(&self) {
        self.emitter.activate(None);
    }

    pub fn subscribe(&self, f: Rc<dyn Fn(&Transaction)>) -> SignalHandlerId {
        let transaction = Rc::clone(&self.inner);
        let id = self.emitter.connect_activate(move |_, _| {
            f(&transaction.borrow().clone());
        });

        id
    }

    pub fn unsubscribe(&self, id: SignalHandlerId) {
        self.emitter.disconnect(id);
    }

    pub fn app_id(&self) -> String {
        self.inner.borrow().app_id.clone()
    }

    pub fn progress(&self) -> f64 {
        self.inner.borrow().progress
    }

    pub fn set_progress(&self, progress: f64) {
        self.inner.borrow_mut().progress = progress;
    }
}

impl From<TransactionContainer> for Transaction {
    fn from(c: TransactionContainer) -> Self {
        c.inner.as_ref().borrow().clone()
    }
}

impl From<Transaction> for TransactionContainer {
    fn from(t: Transaction) -> Self {
        Self::new(t)
    }
}

#[macro_export]
macro_rules! disconnect_handel {
    ($widget: expr, $handle: expr, $fnc:expr) => {
        unsafe {
            let h = $handle.as_raw();
            $widget.connect_destroy(move |_| {
                $fnc(glib::SignalHandlerId::from_glib(h));
            });
        }
    };
}

mod tests {
    #[allow(unused_imports)]
    use super::*;

    #[test]
    fn test_transaction_store() {
        let store = TransactionStore::new();
        let transaction = Transaction {
            app_id: "test".to_string(),
            progress: 0.0,
            state: TransactionState::Install,
            stage: TransactionStage::Start,

            error: None,
            canaled: false,
        };

        let id = store.subscribe(
            &transaction.app_id,
            Rc::new(|t| {
                assert_eq!(t.app_id, "test");
                assert_eq!(t.progress, 0.0);
            }),
        );

        store
            .emitter
            .activate(Some(&glib::Variant::from(&transaction.app_id)));
        store.unsubscribe(id);
    }

    #[test]
    fn test_transaction_container() {
        let transaction = Transaction {
            app_id: "test".to_string(),
            progress: 0.0,
            state: TransactionState::Install,
            stage: TransactionStage::Start,
            error: None,
            canaled: false,
        };

        let container = TransactionContainer::new(transaction.clone());

        let id = container.subscribe(Rc::new(move |t| {
            assert_eq!(t.app_id, "test");
            assert_eq!(t.progress, 0.0);
        }));

        container.emit();
        container.unsubscribe(id);
    }
}
