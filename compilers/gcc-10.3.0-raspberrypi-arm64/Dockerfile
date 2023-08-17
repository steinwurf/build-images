# This image is used for our docker Github Actions runners.
# It gets the matching toolchain for cross-compiling to raspberry pi 3A+, 3B+ and 4.
# See https://github.com/abhiTronix/raspberry-pi-cross-compilers for a guide to download these toolchains.

FROM ubuntu:latest

USER root

LABEL org.opencontainers.image.source https://github.com/steinwurf/build-images

ENV DOWNLOAD_LINK=https://sourceforge.net/projects/raspberry-pi-cross-compilers/files/Raspberry%20Pi%20GCC%20Cross-Compiler%20Toolchains/Buster/GCC%2010.3.0/Raspberry%20Pi%203A%2B%2C%203B%2B%2C%204/cross-gcc-10.3.0-pi_3%2B.tar.gz/download \
    DEBIAN_FRONTEND=noninteractive \
    CXX=arm-linux-gnueabihf-g++ \
    CC=arm-linux-gnueabihf-gcc \
    PATH=/cross-pi-gcc-10.3.0-2/bin:$PATH \
    # The library path from the guide uses an incorrect GLIBC and GLIBCXX. This is the correct path.
    LD_LIBRARY_PATH=/cross-pi-gcc-10.3.0-2/arm-linux-gnueabihf/libc/lib:$LD_LIBRARY_PATH

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
    build-essential \
    gawk \
    gcc \
    g++ \
    gfortran \
    texinfo \
    bison \
    libncurses-dev

RUN wget --no-check-certificate --quiet -O ./cross-gcc-10.3.0-pi_3+.tar.gz $DOWNLOAD_LINK \
    && tar xf ./cross-gcc-10.3.0-pi_3+.tar.gz

RUN arm-linux-gnueabihf-g++ --version

ENTRYPOINT [""]
