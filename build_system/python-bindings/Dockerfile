FROM ubuntu:20.04

USER root

LABEL org.opencontainers.image.source https://github.com/steinwurf/build-images

# This prevents the frontend from hanging the entire process (especially for
# the geography questions in Ubuntu)
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update --yes && \
    apt install --yes --no-install-recommends \
    # Need python 3 for waf
    python3 \
    python3-dev \
    libpython3-dev \
    python3-venv \
    python3-distutils \
    python3-pip \
    # Latest version of gcc (9.3.0) on Ubuntu 20.04
    g++ \
    build-essential \
    # Need cmake and ninja-build for building the bindings
    cmake \
    ninja-build \
    # Required for the actions/checkout@v2 plugin
    ca-certificates \
    # Get SSH Client for Github Actions
    openssh-client \
    git

RUN g++ --version
