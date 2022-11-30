FROM ubuntu:18.04

USER root

LABEL org.opencontainers.image.source https://github.com/steinwurf/build-images

# This prevents the frontend from hanging the entire process (especially for
# the geography questions in Ubuntu)
ENV DEBIAN_FRONTEND=noninteractive \
    PYENV_ROOT=/opt/pyenv \
    PATH=/opt/pyenv/shims:${PATH}

RUN apt update --yes && \
    apt install --yes --no-install-recommends \
    apt-utils \
    software-properties-common \
    g++ \
    ca-certificates \
    openssh-client \
    git \
    tar \
    curl \
    zlib1g-dev \
    libreadline-dev \
    libsqlite3-dev \
    libssl-dev \
    libbz2-dev \
    libncurses5-dev \
    libffi-dev \
    liblzma-dev \
    make \
    gnupg \
    ninja-build \
    wget

RUN curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg \
    | dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
    && chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" \
    | tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
    && apt update \
    && apt install gh -y

RUN wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | apt-key add -

RUN add-apt-repository 'deb https://apt.kitware.com/ubuntu/ bionic main' \
    && apt-get update -y \
    && apt install cmake -y

RUN add-apt-repository ppa:deadsnakes/ppa -y \
    && apt-get update -y \
    && apt install -y python3.10 python3.10-dev python3.10-venv \
    && update-alternatives --install /usr/bin/python python /usr/bin/python3.10 100 \
    && update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.10 100

RUN python3 -m ensurepip --upgrade
RUN python3 -m pip install --upgrade pip

RUN python3 --version


ENTRYPOINT [""]