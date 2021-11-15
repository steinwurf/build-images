FROM python:3.8-alpine

CMD ["/bin/sh"]

RUN apk add --no-cache git

RUN /bin/sh -c set -x \
    && apk add --no-cache cppcheck

RUN cppcheck --version

ENTRYPOINT [""]