use crate::flathub_client::{AppHit, AppInfo, Client, Query, QueryInfo};
use surf::Result;

pub struct HomePageData {
    pub popular: Vec<AppHit>,
    pub recently_added: Vec<AppHit>,
    pub recently_updated: Vec<AppHit>,
}

pub fn get_home_page_data(cb: impl FnOnce(Result<HomePageData>) + 'static) {
    let (sender, receiver) = async_channel::unbounded::<(Query, Result<QueryInfo>)>();
    glib::spawn_future({
        let sender = sender.clone();
        async move {
            let client = Client::new();
            let popular = client.query(Query::Popular, 1, 12).await;
            sender.send((Query::Popular, popular)).await.unwrap();
        }
    });
    glib::spawn_future({
        let sender = sender.clone();
        async move {
            let client = Client::new();
            let recently_added = client.query(Query::RecentlyAdded, 1, 12).await;
            sender
                .send((Query::RecentlyAdded, recently_added))
                .await
                .unwrap();
        }
    });

    glib::spawn_future(async move {
        let client = Client::new();
        let recently_updated = client.query(Query::RecentlyUpdated, 1, 12).await;
        sender
            .send((Query::RecentlyUpdated, recently_updated))
            .await
            .unwrap();
    });

    glib::spawn_future_local(async move {
        let mut popular: Option<Vec<AppHit>> = None;
        let mut recently_added: Option<Vec<AppHit>> = None;
        let mut recently_updated: Option<Vec<AppHit>> = None;

        while let Ok((tag, data)) = receiver.recv().await {
            if let Ok(data) = data {
                match tag {
                    Query::RecentlyAdded => recently_added = Some(data.hits),
                    Query::RecentlyUpdated => recently_updated = Some(data.hits),
                    Query::Popular => popular = Some(data.hits),
                };
            } else if let Err(e) = data {
                cb(Err(e));
                return;
            }
            if popular.is_some() && recently_added.is_some() && recently_updated.is_some() {
                cb(Ok(HomePageData {
                    popular: popular.unwrap(),
                    recently_added: recently_added.unwrap(),
                    recently_updated: recently_updated.unwrap(),
                }));
                return;
            }
        }
    });
}

pub fn get_app_page_data(app_id: &str, cb: impl FnOnce(Result<AppInfo>) + 'static) {
    let (sender, receiver) = async_channel::unbounded::<Result<AppInfo>>();
    glib::spawn_future({
        let app_id = app_id.to_string();
        async move {
            let client = Client::new();
            let app = client.app_info(&app_id).await;
            sender.send(app).await.unwrap();
        }
    });
    glib::spawn_future_local(async move {
        while let Ok(data) = receiver.recv().await {
            cb(data);
            return;
        }
    });
}
