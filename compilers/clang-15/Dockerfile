FROM ubuntu:23.04

USER root

LABEL org.opencontainers.image.source https://github.com/steinwurf/build-images

# This prevents the frontend from hanging the entire process (especially for
# the geography questions in Ubuntu)
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update --yes && \
    apt install --yes --no-install-recommends \
    # Need python 3 for waf
    python3 \
    # Latest version of clang (15.0) on Ubuntu 23.04
    clang \
    # Required for the actions/checkout@v2 plugin
    ca-certificates \
    # Get SSH Client for Github Actions
    openssh-client \
    git \
    file \
    cmake \
    make \
    # Needed for thread and address sanitizer
    libclang-rt-15-dev \
    # Needed for proper TSAN and ASAN support
    llvm


RUN clang --version

ENTRYPOINT [""]
