# ./bin/kafka-topics.sh  --zookeeper localhost:2181 --describe

file="/software/kafka/config/server.properties "
ip=`ifconfig eth1 | grep "inet addr" | awk '{ print $2}' | awk -F: '{print $2}'`
innerIp=`ifconfig eth0 | grep "inet addr" | awk '{ print $2}' | awk -F: '{print $2}'`

echo "broker.id=`cat /etc/zookeeper/conf/myid`" >  ${file}

echo 'listeners=PLAINTEXT://'${innerIp}':9092'  >>  ${file}
echo 'advertised.listeners=PLAINTEXT://'${innerIp}':9092' >> ${file}

# -> config/service.conf
echo  '
port = 9092
zookeeper.connection.timeout.ms=6000
zookeeper.connect=121.42.177.15:2181,121.42.175.237:2181,121.42.182.201:2181

default.replication.factor=2
num.partitions=6

log.dirs=/data/kafka/kafka-logs
log.retention.hours=720

log.retention.check.interval.ms=300000
log.cleanup.policy=delete
log.roll.hours=24
log.segment.bytes=104857600

num.network.threads=3
num.io.threads=8
num.recovery.threads.per.data.dir=1
socket.send.buffer.bytes=102400
socket.receive.buffer.bytes=102400
socket.request.max.bytes=104857600
' >> ${file}
