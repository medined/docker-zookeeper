#! /bin/bash 
set -e

if sudo DOCKER_HOST=$DOCKER_HOST docker ps | grep "medined/docker-zookeeper:3.4.6" >/dev/null; then
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
  ./start-node.sh $index
done

echo "Waiting 30 seconds for zookeeper nodes to find each other."
sleep 30

echo ""
echo "Testing Connection to Zookeeper Nodes"
echo "-------------------------------------"
for index in `seq 3`;
do
  echo "ruok" | netcat -q 2 "10.0.10.$index" 2181; echo " from node $index!"
done
echo ""

sudo DOCKER_HOST=$DOCKER_HOST docker run --name=zookeeper.ui -d -p 9090:9090 medined/docker-zookeeper-ui >  /dev/null

./what-is-ui-url.sh
