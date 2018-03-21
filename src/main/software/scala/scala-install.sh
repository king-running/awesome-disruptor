#!/usr/bin/env bash

#wget http://www.scala-lang.org/files/archive/scala-2.11.8.deb

wget http://dailichi.oss-cn-hangzhou.aliyuncs.com/scala-2.11.8.deb

dpkg -i scala-2.11.8.deb

#apt-get update
#apt-get install scala


mkdir ~/root/bin/
echo 'java -Dsbt.main.class=sbt.ScriptMain -Dsbt.boot.directory=/root/.sbt/boot -jar /usr/share/sbt-launcher-packaging/bin/sbt-launch.jar "$@" '> ~/root/bin/scalas

echo 'PATH=$PATH:/root/bin' >> ~/.profile