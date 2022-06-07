Steinwurf Docker Build Images
=============================

This repository contains the Dockerfiles for the different Docker images that are pushed to the Github Container Registry (GHCR). They are visible in the Organizations 'packages' tab and in this repository's package tab.

Maintainance
------------

Say you need a Docker image for 'foo' version 2, but the latest version on Github is 'foo' version 1. You can then create
a 'foo-2' folder and a Dockerfile for the image.

If you are new to Dockerfiles, here are some ressources to get you started:

* `Dockerfile tutorial by example <https://takacsmark.com/dockerfile-tutorial-by-example-dockerfile-best-practices-2018/>`_
* `Dockerfile reference <https://docs.docker.com/engine/reference/builder/>`_

To ensure that the package is visible in both this repo and the org, you have to add the following line somewhere in the Dockerfile::

    LABEL org.opencontainers.image.source https://github.com/steinwurf/build-images

If you want to push the image to GHCR, login to the registry with your github account from
the command-line. You can follow this `guide <https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry#authenticating-to-the-container-registry>`_

After you have authenticated, you can build your image::

    docker build /path/to/foo-2/ --tag ghcr.io/steinwurf/foo-2:latest

Make sure that the container works as intended and finally push it to GHCR::

    docker push ghcr.io/steinwurf/foo-2:latest

If your image works as intented after you have tested it for your use-case, you can then build it and push it with the 1.0.0 tag.
Versioned tags are assumed to work (unless they are very outdated) and latest tag is used for testing in general.

Make sure to commit the 'foo-2' folder to this Github repository to keep
the packages in sync with this repo.

By default when you add a new image, the package on the repo will be 'private'. Make sure to change it's visibility to public in the specific package's settings on Github. If there are special circumstances where the package should not be public, find and ask someone capable about it.

Versioning
----------

We version our tools with semantic versioning. We separate the version of the
package in the image from the version of the image. For example, if you add a new
version 10 of clang, it would be called clang-10:1.0.0 in the above tag.

We choose not to use the latest tag for our Github Actions workflows, so there's no need to keep this up to date, unless it is needed for your specific use-case.
