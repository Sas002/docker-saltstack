#!/usr/bin/env bash

set -ex

#BUILD
docker-compose -f .travis/compose-${distro}.yaml build --no-cache
docker-compose -f .travis/compose-${distro}.yaml up -d
docker-compose -f .travis/compose-${distro}.yaml ps && sleep 3

#TEST
docker-compose -f .travis/compose-${distro}.yaml exec saltmaster salt-run manage.status
docker-compose -f .travis/compose-${distro}.yaml exec saltminion salt-call test.ping
docker-compose -f .travis/compose-${distro}.yaml exec saltminion salt-call grains.get oscodename
docker-compose -f .travis/compose-${distro}.yaml exec saltmaster salt '*'  state.apply
docker-compose -f .travis/compose-${distro}.yaml exec saltminion salt-call foo.bar
curl -vk https://localhost:8000
