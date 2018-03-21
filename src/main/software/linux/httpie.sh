#!/usr/bin/env bash
if  [ $(cat /etc/*-release | grep -c CentOS) > 0 ] ; then
 yum install -y python-pip
 pip install httpie
else
 apt-get install -y httpie
fi