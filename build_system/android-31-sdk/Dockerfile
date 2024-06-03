FROM ubuntu:22.04

USER root

LABEL org.opencontainers.image.source https://github.com/steinwurf/build-images

ENV DEBIAN_FRONTEND=noninteractive \
    ANDROID_HOME=$PWD/android-sdk/android-sdk-linux

ENV ANDROID_SDK_ROOT=$ANDROID_HOME \
    PATH=$PATH:$ANDROID_HOME/platform-tools \
    ANDROID_COMPILE_SDK=31 \
    ANDROID_BUILD_TOOLS=31.0.0 \
    ANDROID_SDK_TOOLS=7583922_latest \
    ANDROID_EMULATOR_HOME= \
    ANDROID_AVD_HOME=$ANDROID_HOME/emulator/avd

# Install prerequisites
RUN apt-get update --yes  \
    && apt-get install --yes --no-install-recommends \
    # Need openjdk for the gradle builds.
    openjdk-17-jdk \
    # Need python 3 for waf
    python3 \
    # Latest version of gcc
    g++ \
    # Need cmake for building the c++
    cmake \
    ninja-build \
    build-essential \
    # Required for the actions/checkout@v2 plugin
    ca-certificates \
    # Get SSH Client for Github Actions
    openssh-client \
    git \
    wget \
    tar \
    unzip \
    lib32stdc++6 \
    lib32z1

RUN mkdir android-sdk

WORKDIR android-sdk
# Download and setup the Android SDK
RUN wget --quiet --output-document=android-sdk.zip https://dl.google.com/android/repository/commandlinetools-linux-$ANDROID_SDK_TOOLS.zip \
    && unzip -d android-sdk-linux android-sdk.zip \
    && update-alternatives --install /usr/bin/sdkmanager sdkmanager $ANDROID_HOME/cmdline-tools/bin/sdkmanager 100 \
    && echo y | sdkmanager "platforms;android-${ANDROID_COMPILE_SDK}" --sdk_root=$ANDROID_HOME \
    && echo y | sdkmanager "platform-tools" --sdk_root=$ANDROID_HOME \
    && echo y | sdkmanager "build-tools;${ANDROID_BUILD_TOOLS}" --sdk_root=$ANDROID_HOME \
    && yes | sdkmanager --licenses --sdk_root=$ANDROID_HOME --sdk_root=$ANDROID_HOME

# Setup Android ARMv8a emulator
RUN echo y | sdkmanager emulator --sdk_root=$ANDROID_HOME  \
    # && echo y | sdkmanager "system-images;android-31;default;arm64-v8a" --sdk_root=$ANDROID_HOME  \
    && update-alternatives --install /usr/bin/avdmanager avdmanager $ANDROID_HOME/cmdline-tools/bin/avdmanager 100 \
    # && echo no | avdmanager create avd -n "armv8a" -k "system-images;android-31;default;arm64-v8a" --force \
    && update-alternatives --install /usr/bin/adb adb $ANDROID_HOME/platform-tools/adb 100
