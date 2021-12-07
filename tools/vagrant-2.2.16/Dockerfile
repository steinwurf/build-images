FROM debian:buster

USER root

LABEL org.opencontainers.image.source https://github.com/steinwurf/build-images

# This prevents the frontend from hanging the entire process (especially for
# the geography questions in Ubuntu)
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update --yes && \
    apt install --yes --no-install-recommends \
        # Need python 3 for waf
        python3 \
        g++ \
        perl \
        make \
        linux-headers-amd64 \
        # Required for the actions/checkout@v2 plugin
        ca-certificates \
        # Get SSH Client for Github Actions
        openssh-client \
        # Need curl to download vagrant
        curl \
        software-properties-common \
        gnupg2 \
        git

RUN apt-get update && add-apt-repository "deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian buster contrib"

RUN curl -sSL https://www.virtualbox.org/download/oracle_vbox_2016.asc | apt-key add -

RUN apt-get update && apt install --yes --no-install-recommends \
        # Need virtualbox for vagrant
        virtualbox-6.1


# Download version 2.2.16 of vagrant and install
RUN curl -O https://releases.hashicorp.com/vagrant/2.2.16/vagrant_2.2.16_x86_64.deb \
    && apt install ./vagrant_2.2.16_x86_64.deb --yes --no-install-recommends

# RUN dpkg-reconfigure virtualbox-dkms \
#     && dpkg-reconfigure virtualbox
# RUN modprobe vboxdrv \
#     && modprobe vboxnetflt

RUN /sbin/vboxconfig

RUN VBoxManage --version
RUN vagrant --version

ENTRYPOINT [""]