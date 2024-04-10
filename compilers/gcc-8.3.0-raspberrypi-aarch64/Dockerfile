# This image is used for our docker Github Actions runners.
# It gets the matching toolchain for cross-compiling to raspberry pi 3A+, 3B+ and 4.
# See https://github.com/abhiTronix/raspberry-pi-cross-compilers for a guide to download these toolchains.

FROM ubuntu:22.04

USER root

LABEL org.opencontainers.image.source https://github.com/steinwurf/build-images

ENV DOWNLOAD_LINK=https://sourceforge.net/projects/raspberry-pi-cross-compilers/files/Bonus%20Raspberry%20Pi%20GCC%2064-Bit%20Toolchains/Raspberry%20Pi%20GCC%2064-Bit%20Cross-Compiler%20Toolchains/Buster/GCC%208.3.0/cross-gcc-8.3.0-pi_64.tar.gz \
    DEBIAN_FRONTEND=noninteractive \
    CXX=aarch64-linux-gnu-g++ \
    CC=aarch64-linux-gnu-gcc \
    PATH=/cross-pi-gcc-8.3.0-64/bin:/cross-pi-gcc-8.3.0-64/aarch64-linux-gnu/bin:/usr/local/go/bin:$PATH \
    # The library path from the guide uses an incorrect GLIBC and GLIBCXX. This is the correct path.
    STEINWURF_EXTRA_LIB_PATH=/cross-pi-gcc-8.3.0-64/aarch64-linux-gnu/libc/lib64:/cross-pi-gcc-8.3.0-64/aarch64-linux-gnu/lib64

RUN apt update --yes && \
    apt install --yes --no-install-recommends \
    # Need python 3 for waf
    python3 \
    # Required for the actions/checkout@v2 plugin
    ca-certificates \
    # Get SSH Client for Github Actions
    openssh-client \
    git \
    wget \
    curl \
    # Required for the toolchain
    cmake \
    make



RUN wget --no-check-certificate --quiet -O ./cross-gcc-8.3.0-pi_3+.tar.gz $DOWNLOAD_LINK \
    && tar xf ./cross-gcc-8.3.0-pi_3+.tar.gz

RUN aarch64-linux-gnu-g++ --version

# Download Golang 1.22.2
RUN wget --no-check-certificate --quiet -O ./golang.tar.gz https://go.dev/dl/go1.22.2.linux-amd64.tar.gz \
    && tar -C /usr/local -xzf golang.tar.gz

# Download nvm
RUN wget --no-check-certificate --quiet -O /usr/bin/nvm https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh \
    && chmod +x /usr/bin/nvm \
    && . nvm

# Download nodejs 20.3.0
RUN nvm install 20.3.0

# Download npm
RUN nvm install-latest-npm

ENTRYPOINT ["/bin/bash", "-c"]
