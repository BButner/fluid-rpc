use serde::{Deserialize, Serialize};
use crate::api::models::connection::tls_types::tls_type_one_way::TlsTypeOneWay;
use crate::api::models::connection::tls_types::tls_type_two_way::TlsTypeTwoWay;

#[derive(Debug, Serialize, Deserialize)]
pub enum TlsType {
    PlainText,
    OneWay(TlsTypeOneWay),
    TwoWay(TlsTypeTwoWay),
}