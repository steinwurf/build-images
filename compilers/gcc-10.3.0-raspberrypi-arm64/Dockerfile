# This image is used for our docker Github Actions runners.
# It gets the matching toolchain for cross-compiling to raspberry pi 3A+, 3B+ and 4.
# See https://github.com/abhiTronix/raspberry-pi-cross-compilers for a guide to download these toolchains.

FROM ubuntu:latest

USER root

LABEL org.opencontainers.image.source https://github.com/steinwurf/build-images

ENV DOWNLOAD_LINK=https://altushost-swe.dl.sourceforge.net/project/raspberry-pi-cross-compilers/Bonus%20Raspberry%20Pi%20GCC%2064-Bit%20Toolchains/Raspberry%20Pi%20GCC%2064-Bit%20Cross-Compiler%20Toolchains/Stretch/GCC%2010.3.0/cross-gcc-10.3.0-pi_64.tar.gz \
    DEBIAN_FRONTEND=noninteractive \
    CXX=aarch64-linux-gnu-g++ \
    CC=aarch64-linux-gnu-gcc \
    PATH=/cross-pi-gcc-10.3.0-64/bin:$PATH \
    # The library path from the guide uses an incorrect GLIBC and GLIBCXX. This is the correct path.
    LD_LIBRARY_PATH=/cross-pi-gcc-10.3.0-64/aarch64-linux-gnu/libc/lib:$LD_LIBRARY_PATH

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

RUN wget --no-check-certificate --quiet -O ./cross-gcc-10.3.0-pi_64.tar.gz $DOWNLOAD_LINK \
    && tar xf ./cross-gcc-10.3.0-pi_64.tar.gz

RUN aarch64-linux-gnu-g++ --version

ENTRYPOINT [""]
