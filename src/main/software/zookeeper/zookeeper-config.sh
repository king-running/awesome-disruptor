
# 记得 替换 service ip
# 记得 替换 service ip
# 记得 替换 service ip

echo '
# http://hadoop.apache.org/zookeeper/docs/current/zookeeperAdmin.html

dataDir /data/zookeeper/data
dataLogDir /data/zookeeper/datalog

server.1=${service.1 ip}:2888:3888
server.2=${service.2 ip}:2888:3888
server.3=${service.3 ip}:2888:3888

tickTime=2000
initLimit=10
syncLimit=5
clientPort=2181

#preAllocSize=65536
#snapCount=1000
#traceFile=
#leaderServes=yes


' > /etc/zookeeper/conf/zoo.cfg
service zookeeper restart
