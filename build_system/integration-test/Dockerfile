FROM ubuntu:24.04


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
    python3-wheel \
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
    git \
    iproute2 \
    iperf \
    iperf3 \
    iputils-ping


# Create a new group
RUN groupadd -g 988 actions-runner

# Create a new user and assign to the group
# -m: create a home directory for the user
# -g: set primary group
# -s: set the shell
RUN useradd -m -g actions-runner -s /bin/bash -u 999 actions-runner

# Switch to the new user (optional)
USER actions-runner
