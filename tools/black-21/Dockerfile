FROM python:3.8-alpine

CMD ["/bin/sh"]

RUN apk add --no-cache git && apk add --no-cache g++

ARG VER=21.10b0

RUN python -m pip install --upgrade pip

RUN pip install git+git://github.com/psf/black@$VER

ENTRYPOINT [""]
