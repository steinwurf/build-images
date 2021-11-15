FROM ubuntu:20.04

USER root

# This prevents the frontend from hanging the entire process (especially for
# the geography questions in Ubuntu)
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update --yes && \
    apt install --yes --no-install-recommends \
        # Need python 3 for waf
        python3 \
        # Latest version of clang (10.0) on Ubuntu 20.04
        clang \
        # Required for the actions/checkout@v2 plugin
        ca-certificates \
        # Latest version of cmake (3.16.3) on Ubuntu 20.04
        cmake \
        # Get SSH Client for Github Actions
        openssh-client \
        # Need make for cmake
        make \
        git

RUN cmake --version

ENTRYPOINT [""]
