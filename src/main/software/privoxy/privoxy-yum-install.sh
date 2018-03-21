#!/usr/bin/env bash
wget http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
rpm -Uvh epel-release-6-8.noarch.rpm
yum update
yum install privoxy -y


#wget ftp://ftp.pbone.net/mirror/rpm.razorsedge.org/centos-4/RE-test/privoxy-3.0.12-1.el4.re.i386.rpm
#sudo rpm -Uvh privoxy-3.0.12-1.el4.re.i386.rpm
#sudo service privoxy start