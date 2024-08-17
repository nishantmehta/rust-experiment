use actix_web::{Responder};
use chrono::{Utc};
use log::info;
use actix_web::{get, HttpResponse}; 
use hostname;

pub async fn index() -> impl Responder {
    info!("accepting request on /");
    "Hello from Rust web server!"
}

pub async fn sysInfo() -> impl Responder {
    let hostname = hostname::get().unwrap();
    info!("accepting request on /sysInfo");
    let now = Utc::now();
    format!("Hello, world! Today is {}. My name is {}", now.to_string(), hostname.to_string_lossy())
}