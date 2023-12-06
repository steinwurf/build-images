FROM ubuntu:23.04

LABEL org.opencontainers.image.source https://github.com/steinwurf/build-images

USER root

# This prevents the frontend from hanging the entire process (especially for
# the geography questions in Ubuntu)
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update --yes && \
    apt install --yes --no-install-recommends \
    # Need python 3 for waf
    python3 \
    # Latest version of gcc (11.2.0) on Ubuntu 21.10
    g++ \
    # Required for the actions/checkout@v2 plugin
    ca-certificates \
    # Get SSH Client for Github Actions
    openssh-client \
    # Get the latest version of valgrind (3.17.0) on Ubuntu 21.10
    valgrind \
    git \
    cmake \
    make 

RUN valgrind --version

ENTRYPOINT [""]
