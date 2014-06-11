#!/bin/bash

echo "Removing zookeeper and zookeeper ui images"
docker rmi docker/zookeeper 2>/dev/null
docker rmi docker/zookeeper-ui 2>/dev/null

pushd zookeeper
wget --no-clobber http://mirror.symnds.com/software/Apache/zookeeper/current/zookeeper-3.4.6.tar.gz
docker build --rm=true -t $USER/zookeeper .
popd

pushd ui
docker build --rm=true -t $USER/zookeeper-ui .
popd

