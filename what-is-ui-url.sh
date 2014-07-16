#!/bin/bash

IP=`echo $(ifconfig eth0 | awk -F: '/inet addr:/ {print $2}' | awk '{ print $1 }')`

if [ -z $IP ]
then
  IP=`echo $(ifconfig wlan0 | awk -F: '/inet addr:/ {print $2}' | awk '{ print $1 }')`
fi

if [ -z $IP ]
then
  echo "Unable to find host IP address."
  exit 1
fi

echo ""
echo "Visit http://$IP:9090 to see the web-based Zookeeper application."
echo " Use admin/manager to log in."
echo ""
