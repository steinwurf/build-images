FROM python:3.8-alpine

LABEL org.opencontainers.image.source https://github.com/steinwurf/build-images

CMD ["/bin/sh"]

RUN apk add --no-cache git

RUN /bin/sh -c set -x \
    && apk add --no-cache cppcheck

RUN cppcheck --version

ENTRYPOINT [""]