#!/usr/bin/env bash

if [ $(cat /etc/*-release | grep -c CentOS) > 0 ] ; then
    yum groupinstall "Development tools"
    wget http://distfiles.macports.org/ifstat/ifstat-1.1.tar.gz
    tar xzvf ifstat-1.1.tar.gz
    cd ifstat-1.1
    ./configure
    make
    make install
    echo 'nohup ifstat -atT &' >> start-ifstat.sh

else
    apt-get install -y ifstat
fi