#!/bin/sh

T_HOSTNAME=$(hostname)
T_ID=$( echo ${T_HOSTNAME} | cut -d "-" -f2 | cut -d "-" -f1 )

ZOOKEEPER_SERVER_ID=$T_ID

sh /etc/confluent/docker/run
