#!/bin/bash

T_HOSTNAME=$(hostname)
T_ID=$( echo ${T_HOSTNAME} | cut -d "-" -f2 | cut -d "-" -f1 )
T_SERVICE=$( echo ${T_HOSTNAME} | cut -d "-" -f1 )

ZOOKEEPER_SERVER_ID=$T_ID

if [[ -n "${ZOOKEEPER_REPLICAS-}" ]]
then
  i=0
  while [ "$i" -lt $ZOOKEEPER_REPLICAS ]; do
      ZOOKEEPER_SERVERS="${ZOOKEEPER_SERVERS}${T_SERVICE}-${i}:2888:3888;"
      i=$(( i + 1 ))
  done
fi

sh /etc/confluent/docker/run
