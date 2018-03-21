#!/usr/bin/env bash
echo "deb http://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 642AC823
apt-get update -y
apt-get install -y sbt
echo 'export SBT_OPTS="-Dsbt.override.build.repos=true" ' >> ~/.profile
source ~/.profile
cd ~
mkdir .sbt
mkdir .sbt/0.13
mkdir .sbt/0.13/plugins