#!/usr/bin/env bash

danted=`danted -v`

if [[ ${danted} == *"1.3.2"* ]];then
  echo 'has install danted '
else
#    wget http://dailichi.oss-cn-hangzhou.aliyuncs.com/danted-install-real.sh  -O danted-install-real.sh
    chmod 777 danted-install-real.sh
    ./danted-install-real.sh
fi

