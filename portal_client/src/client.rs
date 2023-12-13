use std::sync::mpsc::Sender;

use crate::{ApphubPortalProxy, ApphubPortalProxyBlocking, ApphubTransaction};
use futures::StreamExt;
use gio::prelude::*;
use shared::RUNTIME;

enum InMsg {
    TransactionAdded(dbus_types::Transaction),
    Progress(u32, f64),
    Error(u32, String),
    Done(u32),
}

enum OutMsg {
    Install(u32),
    Uninstall(u32),
    Update(u32),
}

pub struct Client {
    sender: Sender<OutMsg>,
    pub transactions: gio::ListStore,
}

impl Client {
    #[allow(deprecated)]
    pub fn new() -> Self {
        let transactions = gio::ListStore::new::<ApphubTransaction>();
        let (out_sender, out_receiver) = std::sync::mpsc::channel::<OutMsg>();
        let (in_sender, in_receiver) =
            glib::MainContext::channel::<InMsg>(glib::Priority::default());

        RUNTIME.spawn(async move {
            let connection = zbus::Connection::session()
                .await
                .expect("Failed to connect to dbus");
            let proxy = ApphubPortalProxy::new(&connection)
                .await
                .expect("Failed to connect to apphub portal");
            // Pulling for each signal needs to be done in a separate task
            // otherwise the first task will block the second one
            let progress_changed_task = {
                let in_sender = in_sender.clone();
                let mut proxy = proxy.receive_progress_changed().await.unwrap();
                async move {
                    while let Some(v) = proxy.next().await {
                        let args = v.args().unwrap();
                        let id = args.transaction_id;
                        let progress = args.progress;
                        in_sender.send(InMsg::Progress(id, progress)).unwrap();
                    }
                }
            };
            
            let transaction_added_task = {
                let in_sender = in_sender.clone();
                let mut proxy = proxy.receive_transaction_added().await.unwrap();

                async move {
                    loop {
                        println!("Listening for added");
                        if let Some(v) = proxy.next().await {
                            println!("Got transaction added");
                            let args = v.args().unwrap();
                            let transaction = args.transaction;
                            in_sender.send(InMsg::TransactionAdded(transaction)).unwrap();
                        } else {
                            println!("No more transactions");
                        }
                    }
                }
            };

            let transaction_error_task = {
                let in_sender = in_sender.clone();
                let mut proxy = proxy.receive_transaction_error().await.unwrap();
                async move {
                    while let Some(v) = proxy.next().await {
                        let args = v.args().unwrap();
                        let id = args.transaction_id;
                        let error = args.error;
                        in_sender.send(InMsg::Error(id, error)).unwrap();
                    }
                }
            };

            let transaction_done_task = {
                let in_sender = in_sender.clone();
                let mut proxy = proxy.receive_transaction_done().await.unwrap();
                async move {
                    println!("Listening for done");
                    while let Some(v) = proxy.next().await {
                        let args = v.args().unwrap();
                        let id = args.transaction_id;
                        in_sender.send(InMsg::Done(id)).unwrap();
                    }
                }
            };

            tokio::join!(
                progress_changed_task,
                transaction_added_task,
                transaction_error_task,
                transaction_done_task,
            );
        });

        in_receiver.attach(None, {
            let trans = transactions.clone();
            move |msg| {
                println!("Got message");
                match msg {
                    InMsg::TransactionAdded(transaction) => {
                        if find_transaction(&trans, transaction.id).is_some() {
                            panic!("Transaction {} already exists", transaction.id);
                        }
                        trans.append(&ApphubTransaction::from_t(transaction));
                    }
                    InMsg::Progress(id, progress) => {
                        if let Some((_, transaction)) = find_transaction(&trans, id) {
                            transaction.set_progress(progress);
                        }
                    }
                    InMsg::Error(id, error) => {
                        if let Some((_, transaction)) = find_transaction(&trans, id) {
                            if !error.is_empty() {
                                transaction.set_error(error);
                            }
                        }
                    }
                    InMsg::Done(id) => {
                        if let Some((i, transaction)) = find_transaction(&trans, id) {
                            transaction.set_done(true);
                            trans.remove(i);
                        }
                    }
                }
                return glib::ControlFlow::Continue;
            }
        });

        Self {
            sender: out_sender,
            transactions,
        }
    }

}

fn find_transaction(ls: &gio::ListStore, id: u32) -> Option<(u32, ApphubTransaction)> {
    for i in 0..ls.n_items() {
        if let Some(item) = ls.item(i) {
            let transaction = item.downcast_ref::<ApphubTransaction>().unwrap();
            if transaction.id() == id {
                return Some((i, transaction.clone()));
            }
        }
    }
    None
}
