#!/usr/bin/env bash
squidRepo=/etc/yum.repos.d/squid.repo
rm -f ${squidRepo}
touch ${squidRepo}

echo '
[squid]
name=Squid repo for CentOS Linux - $basearch
#IL mirror
baseurl=http://www1.ngtech.co.il/repo/centos/$releasever/$basearch/
failovermethod=priority
enabled=1
gpgcheck=0
' >${squidRepo}

yum update -y
yum install -y squid