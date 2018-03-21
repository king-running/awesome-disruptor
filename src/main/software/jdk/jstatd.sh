#!/usr/bin/env bash
mkdir /data
mkdir /data/javaConfig
cd /data/javaConfig
jsFile=jstatd.all.policy
rm -f ${jsFile}
touch ${jsFile}

echo 'grant codebase "file:${java.home}/../lib/tools.jar" {' >>${jsFile}
echo '    permission java.security.AllPermission;' >>${jsFile}
echo '};' >>${jsFile}

echo 'nohup jstatd -J-Djava.security.policy=jstatd.all.policy -J-Djava.rmi.server.logCalls=true   &' > start-jstatd.sh
echo 'ps -ef | grep jstatd | grep -v grep | cut -c 9-15 | xargs kill -s 9' >stop-jstatd.sh