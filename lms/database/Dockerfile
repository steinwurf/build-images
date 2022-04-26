# syntax=docker/dockerfile:1
FROM python:latest
COPY . .
RUN apt-get update
RUN apt-get install unixodbc-dev -y

RUN pip install -r dev-requirements.txt
ENTRYPOINT /bin/bash ./entrypoint.sh