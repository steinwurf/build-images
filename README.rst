Steinwurf Docker Build Images
=============================

This repository contains the Dockerfiles for the different Docker images on
Steinwurf's Docker Hub (`Steinwurf Docker Hub <https://hub.docker.com/u/steinwurf>`_).

Maintainance
------------

Say you need a Docker image for 'foo' version 2, but the latest version on the
Steinwurf organization on Docker Hub is 'foo' version 1. You can then create
a 'foo-2' folder and a Dockerfile for the image.

If you are new to Dockerfiles, here are some ressources to get you started:

* `Dockerfile tutorial by example <https://takacsmark.com/dockerfile-tutorial-by-example-dockerfile-best-practices-2018/>`_
* `Dockerfile reference <https://docs.docker.com/engine/reference/builder/>`_

Once the Dockerfile is ready you can login to the Steinwurf Docker Hub account
from the command-line::

    docker login -u username -p password

Then you can build your image::

    docker build /path/to/foo-2/ --tag steinwurf/foo:2

Make sure that the container works as intended and finally push it to docker hub::

    docker push steinwurf/foo:2

Make sure to commit the 'foo-2' folder to this Github repository to keep
the Docker Hub in sync with this repo.
