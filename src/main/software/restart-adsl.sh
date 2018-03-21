#!/usr/bin/env bash

oldIp=`wget http://ipinfo.io/ip -qO -`
echo 'old ip :'${oldIp}
function restart {
    echo 'do restart '
    adsl-stop
    adsl-start
}

while true ; do
restart
if [ $( curl --connect-timeout 10 http://www.baidu.com | grep -c '<!DOCTYPE html>'  ) > 0  ] ;then
  newIp=`wget http://ipinfo.io/ip -qO -`
  if [ oldIp != newIp ]; then
    break
  fi
fi
restart
done

newIp=`wget http://ipinfo.io/ip -qO -`
echo 'new ip :'${newIp}

#if [  0 = $( curl --connect-timeout 10 http://www.baidu.com | grep -c '<!DOCTYPE html>' )  ] ; then  echo 111 ; else  echo 222 ; fi