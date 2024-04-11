# This image is used for our docker Github Actions runners.
# It gets the matching toolchain for cross-compiling to raspberry pi 3A+, 3B+ and 4.
# See https://github.com/abhiTronix/raspberry-pi-cross-compilers for a guide to download these toolchains.

FROM ubuntu:22.04

USER root

LABEL org.opencontainers.image.source https://github.com/steinwurf/build-images

ENV DOWNLOAD_LINK=https://altushost-swe.dl.sourceforge.net/project/raspberry-pi-cross-compilers/Raspberry%20Pi%20GCC%20Cross-Compiler%20Toolchains/Buster/GCC%208.3.0/Raspberry%20Pi%203A%2B%2C%203B%2B%2C%204/cross-gcc-8.3.0-pi_3%2B.tar.gz \
    DEBIAN_FRONTEND=noninteractive \
    CXX=arm-linux-gnueabihf-g++ \
    CC=arm-linux-gnueabihf-gcc \
    AR=arm-linux-gnueabihf-ar \
    LD=arm-linux-gnueabihf-ld \
    RANLIB=arm-linux-gnueabihf-ranlib \
    STRIP=arm-linux-gnueabihf-strip \
    READELF=arm-linux-gnueabihf-readelf \
    OBJCOPY=arm-linux-gnueabihf-objcopy \
    OBJDUMP=arm-linux-gnueabihf-objdump \
    NM=arm-linux-gnueabihf-nm \
    AS=arm-linux-gnueabihf-as \
    PATH=/cross-pi-gcc-8.3.0-2/bin:/usr/local/go/bin:$PATH \
    # The library path from the guide uses an incorrect GLIBC and GLIBCXX. This is the correct path.
    STEINWURF_EXTRA_LIB_PATH=/cross-pi-gcc-8.3.0-2/arm-linux-gnueabihf/libc/lib:/cross-pi-gcc-8.3.0-2/arm-linux-gnueabihf/lib

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
    # Required for the toolchain
    cmake \
    make

RUN wget --no-check-certificate --quiet -O ./cross-gcc-8.3.0-pi_3+.tar.gz $DOWNLOAD_LINK \
    && tar xf ./cross-gcc-8.3.0-pi_3+.tar.gz

RUN arm-linux-gnueabihf-g++ --version

# Get go version 1.22.2
RUN wget --no-check-certificate --quiet -O go.tar.gz https://golang.org/dl/go1.22.2.linux-amd64.tar.gz \
    && tar -C /usr/local -xzf go.tar.gz \
    && rm go.tar.gz

# Get nvm and node lts with npm latest
RUN wget --no-check-certificate --quiet -O nvm.sh https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh \
    && chmod +x nvm.sh \
    && ./nvm.sh

ENTRYPOINT [""]
