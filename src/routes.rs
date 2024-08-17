use actix_web::web;
use hostname;

// Import handler functions from handlers.rs
use crate::api_handler::{index, sysInfo};

pub fn configure_routes(cfg: &mut web::ServiceConfig) {
    cfg.route("/", web::get().to(index))
       .route("/sysInfo", web::get().to(sysInfo));
}