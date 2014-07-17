#!/bin/bash

#
# Passing the type changes the zoo.cfg file inside the container.
#

NODEID=1
CONTAINER_ID=$(sudo DOCKER_HOST=$DOCKER_HOST docker run -e "TYPE=SINGLE_NODE" -d -t medined/docker-zookeeper:3.4.6 /docker/files/run.sh $NODEID)
echo "Created container: $CONTAINER_ID"
sudo files/pipework br1 ${CONTAINER_ID} "10.0.10.${NODEID}/24"
