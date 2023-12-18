use crate::transaction::ApphubTransaction;


static mut SELF: Context = Context {
    transactions: None
};

pub struct Context {
    transactions: Option<gio::ListStore>
}

impl Context {
    pub fn init() {
        unsafe {
            SELF.transactions = Some(gio::ListStore::new::<ApphubTransaction>());
        }
    }

    pub fn transactions() -> &'static gio::ListStore {
        unsafe {
            SELF.transactions.as_ref().expect("Context not initialized")
        }
    }

    
}