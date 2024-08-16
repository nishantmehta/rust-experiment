use log::info;
use log4rs;

fn main(){
    log4rs::init_file("log4rs.yaml", Default::default()).unwrap();
    info!("Commencing yak shaving");
    println!("Hello world!");
    info!("Hello world!");
}