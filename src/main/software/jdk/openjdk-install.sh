#!/usr/bin/env bash

yum remove -y java-1.6.0-openjdk
yum remove -y java-1.7.0-openjdk
yum install -y java-1.8.0-openjdk

apt-get install -y python-software-properties
apt-get install -y software-properties-common
add-apt-repository -y ppa:openjdk-r/ppa
apt-get update -y
apt-get autoremove java-common
apt-get install -y openjdk-8-jre