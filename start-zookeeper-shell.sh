#!/bin/bash

usage() {
  echo "Usage: $0 [zookeeper_ensemble]"
  exit 1
}

ZOOKEEPER_ENSEMBLE="$1"

if [ -z $ZOOKEEPER_ENSEMBLE ]
then
  echo "Error: missing zookeeper ensemble parameter."
  usage
fi

docker run -i -t medined/docker-zookeeper-shell:3.4.6 /zookeeper-3.4.6/bin/zkCli.sh -server $ZOOKEEPER_ENSEMBLE

