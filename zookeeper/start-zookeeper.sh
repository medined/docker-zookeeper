#!/bin/bash

NODEID=$1

echo "Node $NODEID reporting for duty!"
echo $NODEID > /zookeeper/data/myid

/opt/zookeeper-3.4.6/bin/zkServer.sh start-foreground
