# Docker MariaDB on Alpine Linux
[![Docker Pull](https://img.shields.io/docker/pulls/bantenitsolutions/mariadb-lite.svg)](https://hub.docker.com/r/bantenitsolutions/mariadb-lite/)
![nginx 1.25](https://img.shields.io/badge/nginx-1.25-brightgreen.svg)
![php 8.3](https://img.shields.io/badge/php-8.3-brightgreen.svg)
[![Docker Test](https://github.com/bitscoid/mariadb-lite/actions/workflows/build.yml/badge.svg?branch=master)](https://github.com/bitscoid/mariadb-lite/actions/workflows/build.yml)
![License MIT](https://img.shields.io/badge/license-MIT-blue.svg)

Example MariaDB container image for Docker, built on [Alpine Linux](https://www.alpinelinux.org/).

Repository: https://github.com/bitscoid/mariadb-lite

* Built on the lightweight and secure Alpine Linux distribution
* Multi-platform, supporting AMD4, ARMv6, ARMv7, ARM64
* Very small Docker image size
* Stable & Latest Version
* Root User allow local only
* The logs of all the services are redirected to the output of the Docker container (visible with `docker logs -f <container name>`)

## [![Banten IT Solutions](https://bits.co.id/wp-content/uploads/Logo.png)](https://bits.co.id)
I can help you with [Web & App Development, Containerization, Kubernetes, Monitoring, Infrastructure as Code.](https://bits.co.id).

## Goal of this project
The goal of this container image is to provide an example for running MariaDB in a container which follows
the best practices and is easy to understand and modify to your needs.

## Usage

Start the Docker container:

    docker run -p 3306:3306 bantenitsolutions/mariadb-lite

Create db folder to Mount Volume Database

    docker run -p 3306:3306 -v ~/db:/var/lib/mysql bantenitsolutions/mariadb-lite

## Configuration
In MariaDB you'll find the default configuration files.
If you want to extend or customize that you can do so by mounting a configuration file in the correct folder;

MariaDB Configuration:

    docker run -v "./mariadb/my.cnf:/etc/my.cnf" bantenitsolutions/mariadb-lite

## Default Password
Please change default user & password !

    root => no password (local access only)

    bits => password (with bits example database name)
