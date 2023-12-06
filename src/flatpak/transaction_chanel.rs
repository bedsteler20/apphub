use gtk::glib::translate::FromGlib;
use gtk::glib::{self, SignalHandlerId};
use gtk::{gio, prelude::*};

use super::*;
// ANCHOR: event_bus

#[derive(Debug, Clone)]
pub struct TransactionChanel {
    transaction: gio::SimpleAction,
}

impl TransactionChanel {
    pub fn new() -> Self {
        Self {
            transaction: gio::SimpleAction::new(
                "transaction",
                Some(TransactionState::static_variant_type().element()),
            ),
        }
    }

    pub fn emit(&self, state: TransactionState) {
        self.transaction.activate(Some(&state.to_variant()));
    }

    pub fn subscribe(&self, f: Box<dyn Fn(TransactionState)>) -> SignalHandlerIdWrapper {
        self.transaction
            .connect_activate(move |_, args| {
                let state = args.unwrap().get::<TransactionState>().unwrap();
                f(state);
            })
            .into()
    }

    pub fn unsubscribe(&self, id: SignalHandlerIdWrapper) {
        self.transaction.disconnect(id.into());
    }
}

// ANCHOR_END: event_bus

// ANCHOR_END: signal_handler_id_wrapper

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
            SignalHandlerIdWrapper::new(SignalHandlerId::from_glib(c))
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

// ANCHOR_END: signal_handler_id_wrapper
