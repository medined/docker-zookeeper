docker-zookeeper-ui
===================

Wraps DeemOpen's zkui project inside Docker.

This project is designed to work with the https://github.com/medined/docker-oracle8-zookeeper-3-4-6 project. At the end of the following steps, you'll have a web-based zookeeper user interface able to read information stored in the zookeepers running under Docker.

 * Follow the instructions at https://github.com/medined/docker-oracle8-zookeeper-3-4-6 to start a zookeeper cluster.

```
docker build --rm-true -t $USER/zookeeper-ui .
docker run --name=zookeeper.ui -d -p 9090:9090 $USER/zookeeper-ui
IP=`echo $(ifconfig eth0 | awk -F: '/inet addr:/ {print $2}' | awk '{ print $1 }')`
echo "Visit http://$IP:9090/"
```

