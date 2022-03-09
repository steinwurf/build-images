FROM ubuntu:20.04

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

USER root

LABEL org.opencontainers.image.source https://github.com/steinwurf/build-images

# This prevents the frontend from hanging the entire process (especially for
# the geography questions in Ubuntu)
ENV DEBIAN_FRONTEND=noninteractive \
    PATH=/emsdk:/emsdk/upstream/emscripten:/emsdk/node/14.18.2_64bit/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \
    EMSDK=/emsdk \
    EM_CONFIG=/emsdk/.emscripten \
    EMSDK_NODE=/emsdk/node/14.18.2_64bit/bin/node


RUN apt update --yes && \
    apt install --yes --no-install-recommends \
        # Need python 3 for waf
        python3 \
        g++ \
        # Latest version of cmake and make
        cmake \
        make \
        # Required for the actions/checkout@v2 plugin
        ca-certificates \
        # Get SSH Client for Github Actions
        openssh-client \
        git \
        # Download utils for getting emscripten
        tar \
        xz-utils \
        bzip2

RUN git clone https://github.com/emscripten-core/emsdk.git

WORKDIR /emsdk

RUN ./emsdk install 3.1.6 && \
    ./emsdk activate 3.1.6

WORKDIR /

RUN apt install --yes --no-install-recommends npm \
    && npm install -g npm@8.5.3

RUN bash -c "source ${HOME}/.bashrc"

RUN em++ --version

ENTRYPOINT [""]
