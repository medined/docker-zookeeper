#!/bin/bash

set -e

echo "Stopping instances"
docker stop cAdvisor zookeeper.ui zookeeper.1 zookeeper.2 zookeeper.3 || true

echo "Removing instances"
docker rm cAdvisor zookeeper.ui zookeeper.1 zookeeper.2 zookeeper.3 || true

echo "Stopped the cluster"

