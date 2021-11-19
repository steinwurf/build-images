FROM ghcr.io/steinwurf/gcc-11.2.0:latest

USER root

LABEL org.opencontainers.image.source https://github.com/steinwurf/build-images

ENV CC=aarch64-linux-gnu-gcc-11 \
    CXX=aarch64-linux-gnu-g++-11

RUN apt-get -qq update \
    && apt-get install -y --no-install-recommends --no-install-suggests \
       libc6-dev-arm64-cross \
       g++-11-aarch64-linux-gnu \
       file \
    && update-alternatives --install /usr/bin/aarch64-linux-gnu-g++ aarch64-linux-gnu-g++ /usr/bin/aarch64-linux-gnu-g++-11 110

RUN aarch64-linux-gnu-g++ --version
