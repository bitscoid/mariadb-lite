<div>
  <div align="center">
    <a href="https://bits.co.id">
      <img
        alt="Banten IT Solutions"
        src="https://bits.co.id/wp-content/uploads/Logo.png"
        width="150">
    </a>
  </div>

  <h1 align="center">Docker MariaDB on Alpine Linux</h1>

  <h4 align="center">
    Lightweight & optimized <a href="https://www.docker.com/blog/how-to-rapidly-build-multi-architecture-images-with-buildx/">Multi-Arch Docker Images</a> (<code>x86_64</code>/<code>arm</code>/<code>arm64</code>) for <a href="https://bits.co.id">MariaDB</a> of latest Alpine Linux.
  </h4>

  <div align="center">
    <a href="https://hub.docker.com/r/bantenitsolutions/mariadb-lite/" title="MariaDB Lite"><img src="https://img.shields.io/docker/pulls/bantenitsolutions/mariadb-lite.svg"></a> 
    <a href="https://hub.docker.com/r/bantenitsolutions/mariadb-lite/" title="Docker Image Version"><img src="https://img.shields.io/docker/v/bantenitsolutions/mariadb-lite/2.0"></a> 
    <a href="https://hub.docker.com/r/bantenitsolutions/mariadb-lite/tags" title="Docker Image Size"><img src="https://img.shields.io/docker/image-size/bantenitsolutions/mariadb-lite/2.0"></a> 
    <a href="https://hub.docker.com/r/bantenitsolutions/mariadb-lite/" title="MariaDB 11.2.2"><img src="https://img.shields.io/badge/mariadb-11.2.2-brightgreen.svg"></a> 
    <a href="https://github.com/bitscoid/mariadb-lite/actions/workflows/build.yml" title="Docker Test Image"><img src="https://github.com/bitscoid/mariadb-lite/actions/workflows/build.yml/badge.svg?branch=master"></a> 
    <a href="https://bits.co.id" title="License MIT"><img src="https://img.shields.io/badge/license-MIT-blue.svg"></a> 
  </div>
</div>


## Description
Example MariaDB container image for Docker, built on [Alpine Linux](https://www.alpinelinux.org/).

Repository: https://github.com/bitscoid/mariadb-lite

* Built on the lightweight and secure Alpine Linux distribution
* Multi-platform, supporting AMD4, ARMv6, ARMv7, ARM64
* Very small Docker image size
* Stable & Latest Version
* Root User allow local only
* The logs of all the services are redirected to the output of the Docker container (visible with `docker logs -f <container name>`)

I can help you with [Web & App Development, Containerization, Kubernetes, Monitoring, Infrastructure as Code.](https://bits.co.id).

## Goal of this project
The goal of this container image is to provide an example for running MariaDB in a container which follows
the best practices and is easy to understand and modify to your needs.

## Usage

Start the Docker container:

    docker run -p 3306:3306 bantenitsolutions/mariadb-lite

Create db folder to Mount Volume Database

    docker run -p 3306:3306 -v ~/db:/var/lib/mysql bantenitsolutions/mariadb-lite

Build with Docker Compose, create docker-compose.yml

    version: '3.7'
    services:
        php:
            image: 'bantenitsolutions/nginx-php-lite'
            restart: 'always'
            volumes:
                - './app:/var/www/bits'
                - './server/nginx/nginx.conf:/etc/nginx/nginx.conf'
                - './server/nginx/http.d/default.conf:/etc/nginx/http.d/default.conf'
                - './server/php/www.conf:/usr/local/etc/php-fpm.d/www.conf'
            ports:
                - '80:80'
        db:
            image: 'bantenitsolutions/mariadb-lite'
            restart: 'always'
            environment:
                MYSQL_USER: 'youruser'
                MYSQL_PASS: 'yourpass'
                MYSQL_NAME: 'yourdbname'
            volumes:
                - './db:/var/lib/mysql'
            ports:
                - '3306:3306'

## Configuration
In MariaDB you'll find the default configuration files.
If you want to extend or customize that you can do so by mounting a configuration file in the correct folder;

MariaDB Configuration:

    docker run -v "./mariadb/my.cnf:/etc/my.cnf" bantenitsolutions/mariadb-lite

## Default Password
Please change default user & password !

| **Default Credentials** 	| **MariaDB Lite**                	|
|-------------------------	|---------------------------------	|
| root                    	| No Password (Local Access Only) 	|
| Username                	| user_bits                       	|
| Password                	| user_password                   	|
| Database Name           	| dbname_bits                     	|
