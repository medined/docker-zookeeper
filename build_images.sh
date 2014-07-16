#!/bin/bash

pushd zookeeper
sudo DOCKER_HOST=$DOCKER_HOST docker build --rm=true -t medined/zookeeper .
popd

pushd ui
sudo DOCKER_HOST=$DOCKER_HOST docker build --rm=true -t medined/zookeeper-ui .
popd

