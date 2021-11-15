FROM ubuntu:21.10

USER root

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
        # Get SSH Client for Github Actions
        openssh-client \
        git

RUN clang --version

ENTRYPOINT [""]