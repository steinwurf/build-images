FROM ubuntu:22.04

USER root

LABEL org.opencontainers.image.source https://github.com/steinwurf/build-images

# Install dependencies

RUN apt-get update && apt-get install -y \
    python3 \
    cmake \
    git \
    ca-certificates \
    tar \
    wget

RUN wget --no-check-certificate --quiet -O "/tmp/gcc-9.3.0-aarch64.tar.xz" "https://developer.nvidia.com/embedded/jetson-linux/bootlin-toolchain-gcc-93"

RUN mkdir /opt/jetson-toolchain && tar -xzf /tmp/gcc-9.3.0-aarch64.tar.xz -C /opt/jetson-toolchain

COPY environment-setup-cross /etc/environment-setup-cross


