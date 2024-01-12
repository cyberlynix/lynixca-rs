FROM rust:1.75.0-bullseye as builder

RUN cargo install cargo-leptos

# Add WASM target for build
RUN rustup target add wasm32-unknown-unknown

# Make an /app dir, which everything will eventually live in
RUN mkdir -p /app
WORKDIR /app
COPY . .

# Build the app
RUN cargo leptos build --release -vv