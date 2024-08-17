# Use the official Rust base image as the builder stage
FROM rust:latest

# Set the working directory inside the container
WORKDIR /app

COPY . .

# Build the Rust application in release mode
RUN cargo build --release

# Install necessary certificates
RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates


# Expose the port your application listens on
EXPOSE 8080

# Specify the command to run when the container starts
CMD ["./app/target/release/rust-experiment"]