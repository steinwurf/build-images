FROM ubuntu:16.04

USER root

LABEL org.opencontainers.image.source https://github.com/steinwurf/build-images

# This prevents the frontend from hanging the entire process (especially for
# the geography questions in Ubuntu)
ENV DEBIAN_FRONTEND=noninteractive \
    PYENV_ROOT=/opt/pyenv \
    PATH=/opt/pyenv/bin:$PATH

RUN apt update --yes && \
    apt install --yes --no-install-recommends \
        # Latest version of gcc (5.4.0) on Ubuntu 16.04
        g++ \
        # Required for the actions/checkout@v2 plugin
        ca-certificates \
        # Get SSH Client for Github Actions
        openssh-client \
        git \
        # Following packages are required to build python 3.7.5
        zlib1g-dev=1:1.* \
        libreadline-dev=6.* \
        libsqlite3-dev=3.* \
        libssl-dev=1.* \
        libbz2-dev=1.* \
        make \
        wget

# Get python 3.7.5
RUN wget --no-check-certificate --quiet -O /tmp/pyenv-installer https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer \
    && chmod +x /tmp/pyenv-installer \
    && /tmp/pyenv-installer \
    && rm /tmp/pyenv-installer \
    && update-alternatives --install /usr/bin/pyenv pyenv /opt/pyenv/bin/pyenv 100 \
    && PYTHON_CONFIGURE_OPTS="--enable-shared" pyenv install 3.7.5 \
    && pyenv global 3.7.5 \
    # remove all __pycache__ directories created by pyenv
    && find /opt/pyenv -iname __pycache__ -print0 | xargs -0 rm -rf \
    && update-alternatives --install /usr/bin/python python /opt/pyenv/shims/python 100 \
    && update-alternatives --install /usr/bin/python3 python3 /opt/pyenv/shims/python3 100

RUN python3 --version
RUN g++ --version

ENTRYPOINT [""]
