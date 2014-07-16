#!/bin/bash

set -e

echo "Stopping instances"
sudo DOCKER_HOST=$DOCKER_HOST docker stop cAdvisor zookeeper.ui zookeeper.1 zookeeper.2 zookeeper.3 || true

echo "Removing instances"
sudo DOCKER_HOST=$DOCKER_HOST docker rm cAdvisor zookeeper.ui zookeeper.1 zookeeper.2 zookeeper.3 || true

echo "Stopped the cluster"

