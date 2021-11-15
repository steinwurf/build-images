FROM python:3.8-alpine

CMD ["/bin/sh"]

RUN apk add --no-cache git && apk add --no-cache g++

ARG VER=4.0.1

RUN python -m pip install --upgrade pip

RUN pip install flake8==$VER

ENTRYPOINT [""]
