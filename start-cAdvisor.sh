#!/bin/bash

sudo DOCKER_HOST=$DOCKER_HOST docker run \
  --name=cAdvisor \
  --volume=/var/run:/var/run:rw \
  --volume=/sys/fs/cgroup/:/sys/fs/cgroup:ro \
  --volume=/var/lib/docker/:/var/lib/docker:ro \
  --publish=8080:8080 \
  --detach=true \
  google/cadvisor

echo ""
echo "cAdvisor is running on port 8080. Note that it might take a lot of CPU."
echo ""
