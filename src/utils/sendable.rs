pub trait Sendable {
    type SendableType: Send + 'static;
    fn to_sendable(&self) -> Self::SendableType;
    fn from_sendable(sendable: Self::SendableType) -> Self;
}
