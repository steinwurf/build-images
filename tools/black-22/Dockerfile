FROM ubuntu:22.04

LABEL org.opencontainers.image.source https://github.com/steinwurf/build-images

CMD ["/bin/sh"]

RUN apt-get update --yes && apt install --yes --no-install-recommends \
    python3 \
    python3-pip \
    # Required for the actions/checkout@v2 plugin
    ca-certificates \
    # Get SSH Client for Github Actions
    openssh-client \
    git \
    file

ARG VER=22.10.0

RUN python3 -m pip install --upgrade pip

RUN pip install black==$VER

ENTRYPOINT [""]
