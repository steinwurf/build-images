FROM ubuntu:21.10

USER root

LABEL org.opencontainers.image.source https://github.com/steinwurf/build-images

# This prevents the frontend from hanging the entire process (especially for
# the geography questions in Ubuntu)
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update --yes && \
    apt install --yes --no-install-recommends \
        # Need python 3 for waf
        python3 \
        # Latest version of clang (13.0) on Ubuntu 21.10
        clang \
        cmake \
        make \
        ninja-build \
        # Required for the actions/checkout@v2 plugin
        ca-certificates \
        # Get SSH Client for Github Actions
        openssh-client \
        git




RUN git clone --depth=1 https://github.com/llvm/llvm-project \
    && mkdir llvm-project/build

WORKDIR llvm-project/build

RUN cmake -GNinja ../llvm \
	-DCMAKE_BUILD_TYPE=Release \
	-DLLVM_ENABLE_PROJECTS="libcxx;libcxxabi" \
	-DCMAKE_C_COMPILER=clang \
	-DCMAKE_CXX_COMPILER=clang++ \
	-DLLVM_USE_SANITIZER=MemoryWithOrigins

RUN cmake --build . -- cxx cxxabi

WORKDIR ~

ENV MSAN_COMMONFLAGS="-fsanitize=memory;-stdlib=libc++;-I/tmp/llvm-project/build/include;-I/tmp/llvm-project/build/include/c++/v1;" \
    MSAN_LINKFLAGS="-lc++abi;-Wl,-rpath,/tmp/llvm-project/build/lib;-L/tmp/llvm-project/build/lib" \
    CXX=clang++ \
    CC=clang

RUN cmake --version

ENTRYPOINT [""]
