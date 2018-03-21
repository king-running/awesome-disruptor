#!/usr/bin/env bash

wget http://www-eu.apache.org/dist/kafka/0.10.1.0/kafka_2.11-0.10.1.0.tgz
tar -xzf kafka_2.11-0.10.1.0.tgz
cd kafka_2.11-0.10.1.0

echo 'nohup ./bin/kafka-server-start.sh config/server.properties  & '> start.sh
echo './bin/kafka-server-stop.sh' > stop.sh