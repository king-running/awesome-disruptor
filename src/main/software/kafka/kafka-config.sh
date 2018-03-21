#!/usr/bin/env bash
# ./bin/kafka-topics.sh  --zookeeper localhost:2181 --describe

you_kafka_install_path=
brokerId=
zookeeperIps= # example : 1.1.1.1:2181,2.2.2.2:2181


file="${you_kafka_install_path}/config/server.properties "

ip=`ifconfig eth1 | grep "inet addr" | awk '{ print $2}' | awk -F: '{print $2}'`
innerIp=`ifconfig eth0 | grep "inet addr" | awk '{ print $2}' | awk -F: '{print $2}'`

echo "broker.id=${brokerId}" >  ${file}

echo 'listeners=PLAINTEXT://'${innerIp}':9092'  >>  ${file}
echo 'advertised.listeners=PLAINTEXT://'${innerIp}':9092' >> ${file}

echo 'port = 9092' >> ${file}
echo 'zookeeper.connection.timeout.ms=6000' >> ${file}
echo 'zookeeper.connect='${zookeeperIps} >> ${file}

#备份数
echo 'default.replication.factor=2' >> ${file}
#分区数
echo 'num.partitions=6' >> ${file}
#log存放的目录
echo 'log.dirs=/data/kafka/kafka-logs' >> ${file}
#默认保存时间
echo 'log.retention.hours=720' >> ${file}
#默认压缩策略
echo 'compression.type=gzip' >>${file}

echo 'log.retention.check.interval.ms=300000' >> ${file}
echo 'log.cleanup.policy=delete' >> ${file}
echo 'log.roll.hours=24' >> ${file}
echo 'log.segment.bytes=104857600' >> ${file}

echo 'num.network.threads=3' >> ${file}
echo 'num.io.threads=8' >> ${file}
echo 'num.recovery.threads.per.data.dir=1' >> ${file}
echo 'socket.send.buffer.bytes=102400' >> ${file}
echo 'socket.receive.buffer.bytes=102400' >> ${file}
echo 'socket.request.max.bytes=104857600' >> ${file}
