# Adminer with Docker

[![Build Status](https://img.shields.io/travis/petk/docker-adminer/master.svg?style=plastic)](https://travis-ci.org/petk/docker-adminer) [![Docker Automated build](https://img.shields.io/docker/automated/petk/adminer.svg?style=plastic)](https://hub.docker.com/r/petk/adminer/) [![MIT License](https://img.shields.io/github/license/petk/docker-adminer.svg?style=plastic "MIT License")](https://github.com/petk/docker-adminer/blob/master/LICENSE)

Adminer with Docker

## Docker tags

The following list contains all current Docker tags and what is included in each.

| System | Docker Tag | Features | Size |
| ------ | ---------- | -------- | ---- |
| **PHP 7.3.3**@Alpine 3.9 | [`latest`](https://github.com/petk/docker-adminer/tree/master/Dockerfile) | Adminer 4.7.1, PHP 7.3, PDO MySQL, PDO PostgreSQL, PDO Sqlite, Nginx | [![](https://images.microbadger.com/badges/image/petk/adminer.svg)](https://microbadger.com/images/petk/adminer "Image size") |

## Usage

Create a `docker-compose.yml` file and add the Adminer service:

```yaml
version: '3.3'

services:
  adminer:
    build:
      context: ../../
      dockerfile: Dockerfile
    restart: always
    ports:
      - 8080:80
    links:
      - db
  db:
    image: mariadb:10.2
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: password
      MYSQL_DATABASE: example-db
```

Run:

```bash
docker-compose up
```

and visit `http://localhost:8080` with server `db`, username `root` and password
`password`.

## Base image

[PHP.earth PHP](https://github.com/php-earth/docker-php) is used for the base
image.

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
