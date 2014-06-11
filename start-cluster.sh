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
  ./start-node.sh $index
done

docker run --name=zookeeper.ui -d -p 9090:9090 $USER/zookeeper-ui >  /dev/null
./what-is-ui-url.sh

