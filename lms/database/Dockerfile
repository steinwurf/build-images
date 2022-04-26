# syntax=docker/dockerfile:1
FROM python:3.8
COPY . .

RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN curl https://packages.microsoft.com/config/debian/11/prod.list > /etc/apt/sources.list.d/mssql-release.list
RUN apt-get update
RUN ACCEPT_EULA=Y apt-get install -y msodbcsql17

# RUN pip install -r dev-requirements.txt
RUN pip install pyodbc
ENTRYPOINT /bin/bash 
#./entrypoint.sh