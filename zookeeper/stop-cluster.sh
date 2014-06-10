et -e

if sudo docker ps | grep "$USER/zookeeper" >/dev/null; then
  sudo docker ps | grep "$USER/zookeeper" | awk '{ print $1 }' | xargs -r sudo docker kill >/dev/null
  echo "Stopped the cluster and cleared all of the running containers."
fi

docker ps -a | grep "$USER/zookeeper" | awk '{print $1}' | xargs docker rm > /dev/null
