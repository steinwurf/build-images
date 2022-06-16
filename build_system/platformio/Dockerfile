FROM python:3.9.0-slim

ENV APP_VERSION="6.0.2" \
    APP="platformio-core"

LABEL org.opencontainers.image.source https://github.com/steinwurf/build-images

RUN pip install -U platformio==${APP_VERSION} && \
    mkdir -p /workspace && \
    mkdir -p /.platformio && \
    chmod a+rwx /.platformio && \
    apt update && apt install -y git && apt-get clean autoclean && apt-get autoremove --yes && rm -rf /var/lib/{apt,dpkg,cache,log}/

USER 1001

WORKDIR /workspace

ENTRYPOINT ["platformio"]
