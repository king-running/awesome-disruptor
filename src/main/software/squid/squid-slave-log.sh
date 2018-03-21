#!/usr/bin/env bash

#---每天 00:00 执行squid log 分割命令
cd /var/log/squid
date=`date +%Y-%m-%d`
squid -k rotate
mv access.log.0 access-${date}.log
mv telegraf.log.0 telegraf-${date}.log

#分割完log之后需要重启telefraf 才能正常的读取log
service telegraf restart