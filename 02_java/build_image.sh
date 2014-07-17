#!/bin/bash
sudo DOCKER_HOST=$DOCKER_HOST docker build --rm=true -t medined/docker-java-oracle:8 .
