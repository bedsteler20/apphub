
use crate::utils::RUNTIME;
/// Runs a future it the tokio runtime and sends the result
/// threw a async_channel. The chanel is pulled in the glib main loop
/// and the callback is called with the result.
/// https://music.youtube.com/watch?v=HKVfpP7ZN8Y
pub fn call_me_maybe<T>(
    future: impl std::future::Future<Output = T> + 'static + Send,
    cb: impl FnOnce(T) + 'static,
) where
    T: 'static + Send,
{
    let (sender, receiver) = async_channel::bounded::<T>(1);
    RUNTIME.spawn(async move {
        let result = future.await;
        sender.send(result).await.unwrap();
    });

    glib::spawn_future_local(async move {
        let result = receiver.recv().await.unwrap();
        cb(result);
    });
}
