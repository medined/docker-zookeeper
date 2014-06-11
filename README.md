docker-zookeeper
----------------

!!! WARNING !!!
!!! WARNING !!!
!!! WARNING !!!

Adding the server.X lines to the zoo.cfg has broken the cluster. Which probably means something is wrong at the networking level. You can remove these lines before starting the cluster to build and start the images. And to see the UI.

```
server.1=10.0.10.1:2888:3888
server.2=10.0.10.2:2888:3888
server.3=10.0.10.3:2888:3888
```

The logs show the following error:

```
2014-06-11 17:35:07,582 [myid:1] - WARN  [WorkerSender[myid=1]:QuorumCnxManager@382] - Cannot open channel to 2 at election address /10.0.10.2:3888
java.net.NoRouteToHostException: No route to host
```

!!! WARNING !!!
!!! WARNING !!!
!!! WARNING !!!

This project has two components. The zookeeper directory contains a Dockerfile to define a zookeeper image. The ui directory contains a Dockerfile to define an image containing DeemOpen's zkui project.

Make sure you have wget and docker installed.

# IP Usage

10.0.10.1 - zookeeper node
10.0.10.2 - zookeeper node
10.0.10.3 - zookeeper node

# Building the images

```
./build_images.sh
```

This script file connects into both sub-directories to build images. The reesult is $USER/zookeeper and $USER/zookeeper-ui images.

# Running the images

```
./start-cluster.sh
```

# Stopping the images

```
./stop-cluster.sh
```

# ZOOKEEPER

For experimenting, you might want to start a single zookeeper node.

```
ZOOKEEPER=$(docker run -d -p 2181:2181 -t $USER/zookeeper)
```

Read the logs

```
docker logs $ZOOKEEPER
```

Verify the running image

Zookeeper accepts the "ruok" text on its port (2181) and it replies "imok".

```
echo "ruok" | netcat -q 2 localhost 2181; echo ", $USER"
```

Stop and remove the image

```
docker stop $ZOOKEEPER
docker rm $ZOOKEEPER
```

Using dynamic ports

```
ZOOKEEPER=$(docker run -d -t $USER/zookeeper)
echo "ruok" | netcat -q 2 localhost `docker port zookeeper 2181|sed 's/.*://'`; echo ", $USER"
docker stop $ZOOKEEPER
docker rm $ZOOKEEPER
```

# Docker Utils

I've found the following commands helpful as I experiment with docker, so I making them easy to find.

## Stop docker processes

```
docker ps -a | grep -v "CONTAINER" | awk '{print $1}' | xargs docker stop
```

## Remove docker processes

```
docker ps -a | grep 'Exited' | awk '{print $1}' | xargs docker rm
```

