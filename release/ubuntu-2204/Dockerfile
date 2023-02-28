FROM ubuntu:22.04

USER root

LABEL org.opencontainers.image.source https://github.com/steinwurf/build-images

# This prevents the frontend from hanging the entire process (especially for
# the geography questions in Ubuntu)
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update --yes && \
    apt install --yes --no-install-recommends \
    # Need python 3 for waf
    python3 \
    python3-pip \
    python3-dev \
    libpython3-dev \
    python3-venv \
    python3-distutils \
    # Latest version of clang (14.0) on Ubuntu 21.10
    clang \
    build-essential \
    cmake \
    make \
    ninja-build \
    clang-format \
    cppcheck \
    valgrind \
    # Required for the actions/checkout@v2 plugin
    ca-certificates \
    # Get SSH Client for Github Actions
    openssh-client \
    git \
    file \
    wget

RUN python3 -m pip install --upgrade pip && \
    python3 -m pip install black flake8
