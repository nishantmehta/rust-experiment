# Use the official Rust base image as the builder stage
FROM rust:latest as builder

# Set the working directory inside the container
WORKDIR /app

# Copy only Cargo.toml and Cargo.lock to leverage Docker's caching
COPY Cargo.toml Cargo.lock ./

# Build dependencies in release mode
RUN cargo build --release

# Copy the rest of the project files
COPY . .

# Build the Rust application in release mode
RUN cargo build --release

# Use a slim Debian-based image for the final runtime stage
FROM debian:buster-slim

# Install necessary certificates
RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates

# Copy the compiled binary from the builder stage
COPY --from=builder /app/target/release/rust-experiment /usr/local/bin/rust-experiment

# Expose the port your application listens on
EXPOSE 8080

# Specify the command to run when the container starts
CMD ["rust-experiment"]