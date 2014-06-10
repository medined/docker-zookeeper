#!/bin/bash

pushd zookeeper
wget --no-clobber http://mirror.symnds.com/software/Apache/zookeeper/current/zookeeper-3.4.6.tar.gz
docker build --rm=true -t $USER/zookeeper .
popd

pushd ui
docker build --rm=true -t $USER/zookeeper-ui .
popd

