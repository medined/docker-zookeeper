#!/bin/bash

IP=`echo $(ifconfig eth0 | awk -F: '/inet addr:/ {print $2}' | awk '{ print $1 }')`
echo ""
echo "Visit http://$IP:9090 to see the web-based Zookeeper application."
echo " Use admin/manager to log in."
echo ""
