#!/bin/bash

NODEID=$1

#
# The entry point into the image is a script file that takes one
# paramter - the node id.
#
CONTAINER_ID=$(sudo docker run -d -i \
  --name "zookeeper.${NODEID}" \
  -h "zoo${NODEID}" \
  -e "ZOO_NODE_NUM=${NODEID}" \
  -t "$USER/zookeeper" $NODEID)

sleep 1

sudo ./pipework br1 ${CONTAINER_ID} "10.0.10.${NODEID}/8"

echo "Started [zoo${NODEID}] and assigned it the IP [10.0.10.${NODEID}]"

if [ "$NODEID" -eq "1" ] ; then
  sudo ifconfig br1 10.0.10.254
  echo "Created interface for host"
  sleep 1
fi
