#!/bin/bash

usage() {
  echo "Usage: $0 [zookeeper_ensemble]"
  exit 1
}

ZOOKEEPER_ENSEMBLE="$1"

if [ -z $ZOOKEEPER_ENSEMBLE ]
then
  ZOOKEEPER_ENSEMBLE="10.0.10.1:2181,10.0.10.2:2181,10.0.10.3:2181"  
fi

sudo DOCKER_HOST=$DOCKER_HOST docker run \
  --name=zookeeper.shell \
  -i \
  -t medined/docker-zookeeper-shell:3.4.6 \
  /docker/files/run.sh "$ZOOKEEPER_ENSEMBLE"

