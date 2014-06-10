docker-zookeeper
----------------

This project has two components. The zookeeper directory allows you to start a three-node zookeeper cluster. The ui directory allows you to start a web application that can explore the zookeeper data. First start the zookeeper ensemble, then start the ui process.

# ZOOKEEPER

First a single node zookeeper is started. Then you'll see how to build a three-node emsemble.

## Single Node

### Build the image

```
wget http://mirror.symnds.com/software/Apache/zookeeper/current/zookeeper-3.4.6.tar.gz
docker build --rm=true -t $USER/zookeeper .
```

### See the image

```
docker images
```

### Run the image

```
ZOOKEEPER=$(docker run -d -p 2181:2181 -t $USER/zookeeper)
```

### Read the logs

```
docker logs $ZOOKEEPER
```

### Verify the running image

Zookeeper accepts the "ruok" text on its port (2181) and it replies "imok".

```
echo "ruok" | netcat -q 2 localhost 2181; echo ", $USER"
```

### Stop and remove the image

```
docker stop $ZOOKEEPER
docker rm $ZOOKEEPER
```

### Using dynamic ports

```
ZOOKEEPER=$(docker run -d -t $USER/zookeeper)
echo "ruok" | netcat -q 2 localhost `docker port zookeeper 2181|sed 's/.*://'`; echo ", $USER"
```

## Three Node Ensemble

Using the same docker image created above, we'll now create a three node ensemble.

### Start the cluster

```
./start-cluster.sh
```

### Stop the ensemble

```
./stop-cluster.sh
```

# Web Application

Wraps DeemOpen's zkui project inside Docker.

This project is designed to work with the https://github.com/medined/docker-oracle8-zookeeper-3-4-6 project. At the end of the following steps, you'll have a web-based zookeeper user interface able to read information stored in the zookeepers running under Docker.

```
docker build --rm-true -t $USER/zookeeper-ui .
docker run --name=zookeeper.ui -d -p 9090:9090 $USER/zookeeper-ui
IP=`echo $(ifconfig eth0 | awk -F: '/inet addr:/ {print $2}' | awk '{ print $1 }')`
echo "Visit http://$IP:9090/"
```


