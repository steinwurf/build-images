FROM ubuntu:18.04

USER root

LABEL org.opencontainers.image.source https://github.com/steinwurf/build-images

# This prevents the frontend from hanging the entire process (especially for
# the geography questions in Ubuntu)
ENV DEBIAN_FRONTEND=noninteractive \
    CMAKE_VERSION_MAJOR_MINOR=3.12 \
    CMAKE_VERSION_FULL=3.12.4 \
    PYENV_ROOT=/opt/pyenv \
    PATH=/opt/pyenv/shims:${PATH} \
    CXX=/usr/bin/g++ \
    CC=/usr/bin/gcc

RUN apt update --yes && \
    apt install --yes --no-install-recommends \
        # Required for the actions/checkout@v2 plugin
        ca-certificates \
        # Get SSH Client for Github Actions
        openssh-client \
        # Need make for cmake
        make \
        wget \
        git \
        python3.7 \
        clang

# Get cmake 3.12.4
RUN ln -s /usr/include/locale.h /usr/include/xlocale.h \
    && rm -rf /var/lib/apt/lists/* \
    && wget --no-check-certificate --quiet https://cmake.org/files/v${CMAKE_VERSION_MAJOR_MINOR}/cmake-${CMAKE_VERSION_FULL}-Linux-x86_64.tar.gz \
    && tar -xzf cmake-${CMAKE_VERSION_FULL}-Linux-x86_64.tar.gz \
       --exclude=bin/cmake-gui \
       --exclude=doc/cmake \
       --exclude=share/cmake-${CMAKE_VERSION_MAJOR_MINOR}/Help \
       --exclude=share/vim \
    && cp -fR cmake-${CMAKE_VERSION_FULL}-Linux-x86_64/* /usr \
    && rm -rf cmake-${CMAKE_VERSION_FULL}-Linux-x86_64 \
    && rm cmake-${CMAKE_VERSION_FULL}-Linux-x86_64.tar.gz

# Set up path for python3.7 to python3
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.7 100

RUN cmake --version

ENTRYPOINT [""]
