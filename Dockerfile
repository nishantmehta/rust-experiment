# Use the official Rust base image as the builder stage
FROM rust:latest

# 2. Copy the files in your machine to the Docker image
COPY ./ ./

# Build your program for release
RUN cargo build --release

EXPOSE 8080

# Run the binary
CMD ["./target/release/rust-experiment"]