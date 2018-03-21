#!/usr/bin/env bash

# https://doub.io/wlzy-16/

if  [ $(cat /etc/*-release | grep -c CentOS) > 0 ] ; then

    wget -O- https://soft.alphabrock.cn/Linux/scripts/bbr_centos_6_7_x86_64.sh | bash
    reboot
    sysctl -a|grep tcp_congestion_control

else
    wget -N --no-check-certificate https://softs.pw/Bash/bbr.sh && chmod +x bbr.sh && bash bbr.sh
fi

#wget -O linux-image-4.9.0-amd64.deb http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.9/linux-image-4.9.0-040900-generic_4.9.0-040900.201612111631_amd64.deb
#dpkg -i linux-image-4.9.0-amd64.deb
#dpkg -l|grep linux-image | awk '{print $2}' | grep -v 'linux-image-4.9.0-040900-generic'
#
#apt-get purge
#
#apt-get purge -y linux-image-extra-4.8.0-32-generic
#apt-get purge -y linux-image-extra-4.8.0-30-generic
#apt-get purge -y linux-image-extra-4.8.0-22-generic
#apt-get purge -y linux-image-4.8.0-32-generic
#apt-get purge -y linux-image-4.8.0-30-generic
#apt-get purge -y linux-image-4.8.0-22-generic
#
#update-grub
#reboot
#
#echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
#echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
#
#sysctl -p
