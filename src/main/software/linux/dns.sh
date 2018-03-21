#!/usr/bin/env bash

echo '
nameserver 223.5.5.5
nameserver 223.6.6.6

'> /etc/resolv.conf

dig www.taobao.com +short
