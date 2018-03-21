#!/usr/bin/env bash

ip=`ifconfig eth1 | grep "inet addr" | awk '{ print $2}' | awk -F: '{print $2}'`
innerIp=`ifconfig eth0 | grep "inet addr" | awk '{ print $2}' | awk -F: '{print $2}'`
