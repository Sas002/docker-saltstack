[![Build Status](https://travis-ci.org/digitalr00ts/docker-saltstack.svg?branch=develop)](https://travis-ci.org/digitalr00ts/docker-saltstack)

# Saltstack Docker Container

This is my effort to run [SaltStack](https://saltstack.com/) masters in Docker containers. Published on [Docker Hub](https://hub.docker.com/r/digitalr00ts/saltstack/).

## Features

* Automated builds
* Available as Alpine or Ubuntu
* TLS for API enabled by default (self-signed cert generated if no cert found)
* Docker's in container process manager [tini](https://github.com/krallin/tini) baked in.

### Extra notes

* The images on the official [SaltStack repo](https://github.com/saltstack/docker-containers) are not well maintained.
* The base images, w/o SaltStack, are separated into their own [repo](https://github.com/digitalr00ts/docker-saltstack-base).

## Usage

### Run

```sh
docker run -d --name saltstack digitalr00ts/saltstack
```

### Build test

```sh
docker-compose -f .travis/compose-<distro>.yaml up -d --build
```

## Todos

* Better testing
* Run salt service as not root
* Add volumes to docker-compose
* Change curl/wget url to use ARG for branch
* Ability to build Saltstack off commit
  * and point at any git url
* Better documentation
  * Usage / paths
  * Layers

## Anchor.io

* Alpine: [![Anchore Image Overview](https://anchore.io/service/badges/image/0eee9477226f99e9fd655776b93942ba9207b0b25ca56bee76cd104f698da231)](https://anchore.io/image/dockerhub/0eee9477226f99e9fd655776b93942ba9207b0b25ca56bee76cd104f698da231?repo=digitalr00ts%2Fsaltstack&tag=latest)
* Ubuntu: [![Anchore Image Overview](https://anchore.io/service/badges/image/2a7fb41b7529b11f238953c6eab4bce66da9382e8ad215b4c9552643d7ef5b49)](https://anchore.io/image/dockerhub/2a7fb41b7529b11f238953c6eab4bce66da9382e8ad215b4c9552643d7ef5b49?repo=digitalr00ts%2Fsaltstack&tag=ubuntu)
