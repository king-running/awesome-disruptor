squidConfigFile='/etc/squid/squid.conf'
rm -f ${squidConfigFile}
touch ${squidConfigFile}

###------squid

#允许所有人使用该代理.因为这里是代理加速web服务器
echo '
http_access allow all
http_reply_access allow all
http_port 8888

' >${squidConfigFile}

echo '
#log 格式
#log文件存放路径和日志格式
logformat telegraf squid,method="%rm",code=%>Hs useTime=%tr,fromIp="%>a",size=%<st,url="%ru" %ts%03tu000000
logformat squid [%{%Y-%b-%d %H:%M:%S}tl] total:%6tr dns:%4dt ||  %12>a %Ss/%03>Hs %<st %rm %ru %un %Sh/%<A %mt
access_log /var/log/squid/access.log  squid
access_log /var/log/squid/telegraf.log telegraf
logfile_rotate 30

visible_hostname squid.server.com

'>>${squidConfigFile}


###############  HEADER
# delete header:X-Forwarded-For  (X-Forwarded-For : client real ip)
echo 'forwarded_for delete' >>${squidConfigFile}
echo 'via off' >>${squidConfigFile}


###############  DNS
#优先使用v4
# http://linuxadmin.melberi.com/2015/04/squid-error-tcpmissaborted000-0-get.html
echo 'dns_v4_first on' >>${squidConfigFile}

#指定使用的dns 列表
echo 'dns_nameservers 223.5.5.5 223.6.6.6' >>${squidConfigFile}

#设置缓存成功的DNS查询结果的生存时间。缺省为6小时。
echo 'positive_dns_ttl 1 hours' >>${squidConfigFile}



###############  CACHE
echo'cache_replacement_policy lru' >>${squidConfigFile}
# cache丢失或不存在是允许所有请求直接转发到原始服务器
echo 'always_direct allow all ' >>${squidConfigFile}
#允许直接更新请求
echo 'miss_access allow all' >>${squidConfigFile}
# 额外提供给squid使用的内存，squid的内存总占用为 X * 10+15+“cache_mem”，其中X为squid的cache占用的容量（以GB为单位
# 比如下面的cache大小是100M，即0.1GB，则内存总占用为0.1*10+15+64=80M，推荐大小为物理内存的1/3-1/2或更多。
echo 'cache_mem 80 MB' >>${squidConfigFile}

#设置squid磁盘缓存最大文件，超过4M的文件不保存到硬盘
echo 'maximum_object_size 4 MB' >>${squidConfigFile}

#设置squid磁盘缓存最小文件
echo 'minimum_object_size 1 KB '>>${squidConfigFile}

#定义squid的cache存放路径 、cache目录容量（单位M）、一级缓存目录数量、二级缓存目录数量
echo 'cache_dir ufs /var/spool/squid 100 16 256' >>${squidConfigFile}

#禁用缓存
#echo 'cache deny all' >>${squidConfigFile}
#echo 'request_size 10000 KB' > ${squidConfigFile}
#echo 'debug_options ALL,1 ' > ${squidConfigFile}
#echo 'http_access allow all manager' >>${squidConfigFile}
#echo 'cache_dir ufs /var/spool/squid 100 16 256 #read-only' >>${squidConfigFile}


###############  CONFIG
#每个连接最多存活 5 分钟
echo 'client_lifetime 30 minutes' >>${squidConfigFile}
echo 'acl allowmax maxconn 4096' >>${squidConfigFile}
#允许最大打开文件数量,0 无限制
echo 'max_open_disk_fds 0 '
echo 'half_closed_clients off' >>${squidConfigFile}
echo 'request_timeout 5 minutes' >>${squidConfigFile}
echo 'connect_timeout 5 minutes' >>${squidConfigFile}
echo 'high_response_time_warning 3000' >>${squidConfigFile}


service squid reload
#auth_param basic program /usr/lib/squid3/basic_ncsa_auth /etc/squid3/squid_passwd
#auth_param basic realm Welcome to my system
#acl auth_user proxy_auth REQUIRED
#http_access allow auth_user

