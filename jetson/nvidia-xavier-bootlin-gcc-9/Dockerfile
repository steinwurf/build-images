FROM ubuntu:22.04

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

COPY environment-setup-evologics /usr/bin/environment-setup-evologics

RUN /usr/bin/environment-setup-evologics

