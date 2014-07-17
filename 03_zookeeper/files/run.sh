#!/bin/bash

NODEID=$1

echo "Node $NODEID reporting for duty!"
echo $NODEID > /zookeeper/data/myid

IPADDR="10.0.10.${NODEID}"

/docker/files/pipework --wait br1 "zookeeper.${NODEID}"  "$IPADDR/24"

if [ "$TYPE" == "SINGLE_NODE" ]
then
  cp /docker/files/single-node-zoo.cfg /usr/lib/zookeeper-3.4.6/conf/zoo.cfg
fi

/usr/bin/supervisord -n
