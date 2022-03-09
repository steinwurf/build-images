FROM ubuntu:21.10

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
        bzip2 \
        # Node.js and npm
        nodejs \
        npm

RUN git clone https://github.com/emscripten-core/emsdk.git

WORKDIR /emsdk

RUN apt install --yes --no-install-recommends

RUN ./emsdk install 3.1.6 && \
    ./emsdk activate 3.1.6

WORKDIR /

RUN em++ --version



ENTRYPOINT [""]
