#!/usr/bin/env bash

git clone https://github.com/Centaur/repox.git
cd repox/src/main/resources/admin
apt-get -y install nodejs
cp `which nodejs`  `which node`
apt-get -y install npm
npm install -g bower

bower install --allow-root

cd ../../../..
sbt assembly
