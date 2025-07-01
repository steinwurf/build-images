FROM alpine:3.18

ARG ZIG_VERSION=0.14.1
ENV ZIG_VERSION=${ZIG_VERSION}

# Install dependencies (with glibc compatibility for Zig)
RUN apk add --no-cache \
      bash \
      curl \
      ca-certificates \
      gnupg \
      unzip \
      git \
      build-base \
      cmake \
      ninja \
      python3 \
      python3-dev \
      py3-pip \
      openssh-client \
      libc6-compat

# Download and install Zig
RUN set -eux; \
    ARCH=x86_64-linux; \
    FILENAME=zig-${ARCH}-${ZIG_VERSION}; \
    URL=https://ziglang.org/download/${ZIG_VERSION}/${FILENAME}.tar.xz; \
    curl -LO "$URL"; \
    tar -xf "${FILENAME}.tar.xz"; \
    mv "$FILENAME" /opt/zig; \
    ln -s /opt/zig/zig /usr/local/bin/zig; \
    rm "${FILENAME}.tar.xz"

CMD ["/bin/bash"]
