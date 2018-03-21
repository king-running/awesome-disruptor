#!/usr/bin/env bash

#install
curl -sSL https://get.docker.com/ | sh
curl -L https://github.com/docker/compose/releases/download/1.1.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
pip install 'docker-compose'
pip install 'docker-py'

vi /etc/default/docker
DOCKER_OPTS="--registry-mirror=https://pee6w651.mirror.aliyuncs.com"
DOCKER_OPTS="--insecure-registry=10.163.108.146:5000"