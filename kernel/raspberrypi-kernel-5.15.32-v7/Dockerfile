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
    libncurses5-dev \
    libmpc-dev

ENV DOWNLOAD_LINK=https://master.dl.sourceforge.net/project/raspberry-pi-cross-compilers/Raspberry%20Pi%20GCC%20Cross-Compiler%20Toolchains/Bullseye/GCC%2010.3.0/Raspberry%20Pi%202%2C%203/cross-gcc-10.3.0-pi_2-3.tar.gz \
    DEBIAN_FRONTEND=noninteractive \
    PATH=/cross-pi-gcc-10.3.0-1/bin:$PATH \
    # The library path from the guide uses an incorrect GLIBC and GLIBCXX. This is the correct path.
    LD_LIBRARY_PATH=/cross-pi-gcc-10.3.0-1/arm-linux-gnueabihf/libc/lib:$LD_LIBRARY_PATH

RUN wget --no-check-certificate --quiet -O ./cross-gcc-10.3.0-pi_2-3.tar.gz $DOWNLOAD_LINK \
    && tar xf ./cross-gcc-10.3.0-pi_2-3.tar.gz

RUN rm cross-gcc-10.3.0-pi_2-3.tar.gz

RUN git clone --depth=300 --branch rpi-5.15.y https://github.com/raspberrypi/linux

WORKDIR /linux

RUN KERNEL=kernel7 make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- bcm2709_defconfig

RUN git checkout e29be6724

RUN make -j $(($(nproc) - 1)) ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- zImage modules dtbs

RUN rm -rf .git

WORKDIR /
