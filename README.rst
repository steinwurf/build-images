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

If you want to push the image to Docker Hub login to the Steinwurf account from
the command-line::

    docker login -u username -p password

Then you can build your image::

    docker build /path/to/foo-2/ --tag ghcr.io/steinwurf/foo:2

Make sure that the container works as intended and finally push it to docker hub::

    docker push ghcr.io/steinwurf/foo:2

Make sure to commit the 'foo-2' folder to this Github repository to keep
the Docker Hub in sync with this repo.

Versioning
----------

We version our tools with semantic versioning. We separate the version of the
package in the image from the version of the image. For example, if you add a new
version 10 of clang, it would be called clang-10:1.0.0 in the above tag.

When you release a new version of an image, remember to update the 'latest'-tag,
such that Github Actions workflows, that always use the latest version of the
image, are updated.
