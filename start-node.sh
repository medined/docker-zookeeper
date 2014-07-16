#!/bin/bash

NODEID=$1

#
# The entry point into the image is a script file that takes one
# paramter - the node id.
#
CONTAINER_ID=$(sudo DOCKER_HOST=$DOCKER_HOST docker run -d -i \
  --name "zookeeper.${NODEID}" \
  -h "zoo${NODEID}" \
  -e "ZOO_NODE_NUM=${NODEID}" \
  -t "medined/zookeeper" $NODEID)

sudo ./pipework br1 ${CONTAINER_ID} "10.0.10.${NODEID}/24"

if [ "$NODEID" -eq "1" ] ; then
  sudo ifconfig br1 10.0.10.254
  echo "Created interface for host"
  sleep 1
fi

echo "Started [zoo${NODEID}] and assigned it the IP [10.0.10.${NODEID}]"
