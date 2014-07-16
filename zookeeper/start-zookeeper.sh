#!/bin/bash

NODEID=$1

echo "Node $NODEID reporting for duty!"
echo $NODEID > /zookeeper/data/myid

IPADDR="10.0.10.${NODEID}"

/pipework --wait br1 zookeeper.ui  "$IPADDR/24"

/opt/zookeeper-3.4.6/bin/zkServer.sh start-foreground
