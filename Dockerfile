#  _                 _       _____               _____   _____                              
# | |               (_)     / ____|   /\        |  __ \ / ____|     /\                      
# | |    _   _ _ __  ___  _| |       /  \ ______| |__) | (___      /  \__      _____   ___  
# | |   | | | | '_ \| \ \/ / |      / /\ \______|  _  / \___ \    / /\ \ \ /\ / / _ \ / _ \ 
# | |___| |_| | | | | |>  <| |____ / ____ \     | | \ \ ____) |  / ____ \ V  V / (_) | (_) |
# |______\__, |_| |_|_/_/\_\\_____/_/    \_\    |_|  \_\_____/  /_/    \_\_/\_/ \___/ \___/ 
#         __/ |                                                                             
#        |___/  
#                                                                            
# DOCKER BUILD SCRIPT FOR LYNIXCA-RS (RUST VERSION)                                  

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