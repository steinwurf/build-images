FROM ubuntu:22.10

USER root

LABEL org.opencontainers.image.source https://github.com/steinwurf/build-images

# This prevents the frontend from hanging the entire process (especially for
# the geography questions in Ubuntu)
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update --yes && \
    apt install --yes --no-install-recommends \
    # Need python 3 for waf
    python3 \
    # Latest version of clang (13.0) on Ubuntu 21.10
    clang \
    # Required for the actions/checkout@v2 plugin
    ca-certificates \
    # Latest version of cmake (3.18.4) on Ubuntu 21.10
    cmake \
    # Get SSH Client for Github Actions
    openssh-client \
    # Need make for cmake
    make \
    git

RUN cmake --version

ENTRYPOINT [""]
