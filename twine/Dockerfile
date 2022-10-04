# syntax=docker/dockerfile:1
FROM Ubuntu:22.04

# This will automatically add the container to the packages under build-images repository
LABEL org.opencontainers.image.source https://github.com/steinwurf/build-images
# This will make debian and ubuntu not ask about things as timezone, etc.
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    python3 \
    python3-pip \
    python3-venv \
    python3-dev \
    ca-certificates \ 
    curl

RUN curl https://sh.rustup.rs -sSf | \
    sh -s -- --default-toolchain stable -y
