#!/bin/sh

T_HOSTNAME=$(hostname)
T_ID=$( echo ${T_HOSTNAME} | cut -d "-" -f2 | cut -d "-" -f1 )
T_SERVICE=$( echo ${T_HOSTNAME} | cut -d "-" -f1 )

ZOOKEEPER_SERVER_ID=$T_ID

if [[ -n "${ZOOKEEPER_REPLICAS-}" ]]
then
  for (( i=0; i<=$ZOOKEEPER_REPLICAS-1; i++ ))
  do
    ZOOKEEPER_SERVERS="${ZOOKEEPER_SERVERS}${T_SERVICE}-${i}:2888:3888;"
  done
fi

sh /etc/confluent/docker/run
