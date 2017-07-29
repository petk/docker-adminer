# Adminer with Docker

[![Build Status](https://img.shields.io/travis/petk/docker-adminer/master.svg?style=plastic)](https://travis-ci.org/petk/docker-adminer) [![Docker Automated build](https://img.shields.io/docker/automated/petk/adminer.svg?style=plastic)](https://hub.docker.com/r/petk/adminer/) [![MIT License](https://img.shields.io/github/license/petk/docker-adminer.svg?style=plastic "MIT License")](https://github.com/petk/docker-adminer/blob/master/LICENSE)

Adminer with Docker

## Docker tags

The following list contains all current Docker tags and what is included in each.

| System | Docker Tag | Features | Size |
| ------ | ---------- | -------- | ---- |
| **PHP 7.1.7**@Alpine 3.6 | [`latest`](https://github.com/petk/docker-adminer/tree/master/Dockerfile) | PHP 7.1, Nginx, Adminer 4.3.1 | [![](https://images.microbadger.com/badges/image/petk/adminer.svg)](https://microbadger.com/images/petk/adminer "Image size") |
|

## Building images

Images are automatically build on [Docker Hub](https://hub.docker.com/r/petk/adminer/).

Docker Cloud and therefore Docker Hub also provides
[overriding and customization](https://docs.docker.com/docker-cloud/builds/advanced/)
of various commands when building images automatically.

There are some hooks defined in the `docker/hooks` folder:

* `hooks/build` - executed when building image

### Labels

[Labels](https://docs.docker.com/engine/userguide/labels-custom-metadata/) are
neat way to expose additional metadata about particular Docker object. We use
[Label Schema](http://label-schema.org/) when defining image labels:

* `build-date` - Date and time of the build. Defined as
  `org.label-schema.build-date=$BUILD_DATE`, where `$BUILD_DATE` is set dynamically
  via above `hooks/build` script
* `vcs-url` - Repository location on GitHub. Defined as
  `org.label-schema.vcs-url="https://github.com/petk/docker-adminer.git"`
* `vcs-ref` - Reference to commit in Git repository
* `schema-version` - Version of the Label Schema in use.
* `vendor` - Vendor name of the image creators.
* `name`
* `description`
* `url`

## License and contributing

[Contributions](https://github.com/petk/docker-adminer/blob/master/CONTRIBUTING.md) are most welcome. This repository is released under the [MIT license](https://github.com/petk/docker-adminer/blob/master/LICENSE).
