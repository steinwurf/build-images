FROM ubuntu:14.04

USER root

LABEL org.opencontainers.image.source https://github.com/steinwurf/build-images

# This prevents the frontend from hanging the entire process (especially for
# the geography questions in Ubuntu)
ENV DEBIAN_FRONTEND=noninteractive \
    LC_ALL=C.UTF-8 \
    LANG=C.UTF-8

RUN apt-get update --yes && \
    apt-get install --yes --no-install-recommends \
        # Required for the actions/checkout@v2 plugin
        ca-certificates \
        python3 \
        openssh-client \
        git \
        build-essential

RUN python3 --version
