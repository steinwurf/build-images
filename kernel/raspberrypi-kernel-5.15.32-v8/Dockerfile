FROM debian:bullseye-slim

USER root

LABEL org.opencontainers.image.source https://github.com/steinwurf/build-images

RUN apt update --yes && \
    apt install --yes --no-install-recommends \
    python3 \
    ca-certificates \
    openssh-client \
    sshpass \
    git \
    wget \
    bc \
    gcc \
    bison \
    flex \
    libssl-dev \
    make \
    libc6-dev \
    libncurses5-dev

ENV DOWNLOAD_LINK=https://netix.dl.sourceforge.net/project/raspberry-pi-cross-compilers/Bonus%20Raspberry%20Pi%20GCC%2064-Bit%20Toolchains/Raspberry%20Pi%20GCC%2064-Bit%20Cross-Compiler%20Toolchains/Bullseye/GCC%2010.3.0/cross-gcc-10.3.0-pi_64.tar.gz \
    DEBIAN_FRONTEND=noninteractive \
    PATH=/cross-pi-gcc-10.3.0-64/bin:$PATH \
    # The library path from the guide uses an incorrect GLIBC and GLIBCXX. This is the correct path.
    LD_LIBRARY_PATH=/cross-pi-gcc-10.3.0-64/aarch64-linux-gnu/libc/lib:$LD_LIBRARY_PATH

RUN wget --no-check-certificate --quiet -O ./cross-gcc-10.3.0-pi_64.tar.gz $DOWNLOAD_LINK \
    && tar xf ./cross-gcc-10.3.0-pi_64.tar.gz

RUN rm cross-gcc-10.3.0-pi_64.tar.gz

RUN git clone --depth=300 --branch rpi-5.15.y https://github.com/raspberrypi/linux

WORKDIR /linux

RUN KERNEL=kernel8 make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- bcm2711_defconfig

RUN git checkout e29be6724

RUN make -j $(($(nproc) - 1)) ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- Image modules dtbs

RUN rm -rf .git

WORKDIR /
