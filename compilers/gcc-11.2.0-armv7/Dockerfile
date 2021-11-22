FROM ghcr.io/steinwurf/gcc-11.2.0:latest

USER root

LABEL org.opencontainers.image.source https://github.com/steinwurf/build-images

ENV CC=arm-linux-gnueabi-gcc-11 \
    CXX=arm-linux-gnueabi-g++-11

RUN apt-get -qq update \
    && apt-get install -y --no-install-recommends --no-install-suggests \
       libc6-dev \
       g++-11-arm-linux-gnueabi \
       file \
    && update-alternatives --install /usr/bin/arm-linux-gnueabi-g++ arm-linux-gnueabi-g++ /usr/bin/arm-linux-gnueabi-g++-11 110 \
    && rm -rf /var/lib/apt/lists/*

RUN arm-linux-gnueabi-g++ --version