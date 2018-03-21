#!/usr/bin/env bash

if  [ $(cat /etc/*-release | grep -c CentOS) > 0 ] ; then
    yum -y install epel-release
    yum -y install htop
else
    apt-get install -y htop
fi