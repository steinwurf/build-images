FROM mcr.microsoft.com/azure-sql-edge:latest
# Switch to root user for access to apt-get install
USER root

LABEL org.opencontainers.image.source https://github.com/steinwurf/build-images

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Bundle app source
COPY . /usr/src/app


# Grant permissions for the import-data script to be executable
RUN chmod +x /usr/src/app/import-data.sh


# Switch back to mssql user and run the entrypoint script
USER mssql
ENTRYPOINT /bin/bash ./entrypoint.sh
