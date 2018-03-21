#!/usr/bin/env bash

sudo apt-get install software-properties-common
sudo add-apt-repository -y ppa:ondrej/mysql-5.7

sudo apt-get update
sudo apt-get install mysql-server