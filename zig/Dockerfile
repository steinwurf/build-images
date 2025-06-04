FROM ubuntu:24.04

ARG ZIG_VERSION=0.14.1
ENV ZIG_VERSION=${ZIG_VERSION}

# Install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl ca-certificates gnupg unzip git \
    build-essential cmake ninja-build \
    python3 python3-pip python3-venv \
    openssh-client \
    && rm -rf /var/lib/apt/lists/*

# Download and install Zig from fixed URL pattern
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