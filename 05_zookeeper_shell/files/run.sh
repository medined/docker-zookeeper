#!/bin/bash
ZOOKEEPER_ENSEMBLE=$1
/usr/lib/zookeeper-3.4.6/bin/zkCli.sh -server $ZOOKEEPER_ENSEMBLE
