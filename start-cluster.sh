#! /bin/bash

set -e

if sudo docker ps | grep "$USER/zookeeper" >/dev/null; then
  echo ""
  echo "It looks like you already have some containers running."
  echo "Please take them down before attempting to bring up another"
  echo "cluster with the following command:"
  echo ""
  echo "  make stop-cluster"
  echo ""

  exit 1
fi

for index in `seq 3`;
do
  CONTAINER_ID=$(sudo docker run -d -i \
    --name "zookeeper.${index}" \
    -h "zoo${index}" \
    -e "ZOO_NODE_NUM=${index}" \
    -t "$USER/zookeeper")

  echo "Created container [zoo${index}] = ${CONTAINER_ID}"

  sleep 1

  sudo ./pipework br1 ${CONTAINER_ID} "10.0.10.${index}/24"

  echo "Started [zoo${index}] and assigned it the IP [10.0.10.${index}]"
  
  if [ "$index" -eq "1" ] ; then
    sudo ifconfig br1 10.0.10.254
    #sudo ip addr add 10.0.10.254/24 dev br1
    echo "Created interface for host"
    sleep 1
  fi
done

docker run --name=zookeeper.ui -d -p 9090:9090 $USER/zookeeper-ui
IP=`echo $(ifconfig eth0 | awk -F: '/inet addr:/ {print $2}' | awk '{ print $1 }')`
echo ""
echo "Visit http://$IP:9090/ to see the web-based Zookeeper application."
echo " Use admin/manager to log in."
echo "" 

