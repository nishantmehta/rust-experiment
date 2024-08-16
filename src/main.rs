use log::{info, trace, warn};

fn main(){
    log::trace!("Commencing yak shaving");
    
    //log4rs::init_file("log4rs.yaml", Default::default()).unwrap();
    println!("Hello world!");
    log::warn!("Hello world!");
}