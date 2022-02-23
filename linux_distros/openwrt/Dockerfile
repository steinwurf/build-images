FROM openwrtorg/rootfs:x86-64

USER root

LABEL org.opencontainers.image.source https://github.com/steinwurf/build-images

RUN cat /etc/banner

RUN mkdir /var/lock

RUN opkg update && \
    opkg install \
        # Need python 3 for waf
        python3 \
        # Latest version of gcc (7.4.0) on Ubuntu 21.10
        gcc \
        # Required for the actions/checkout@v2 plugin
        ca-certificates \
        # Get SSH Client for Github Actions
        openssh-client \
        git

RUN g++ --version
