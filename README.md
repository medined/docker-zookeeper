docker-zookeeper
----------------

Using this project you can start a three node Zookeeper ensemble using the commands below.

```
./build_images.sh
./start_cluster.sh
```

# IP Usage

```
10.0.10.1 - zookeeper node
10.0.10.2 - zookeeper node
10.0.10.3 - zookeeper node
```

## Which node is Zookeeper leader?

```
for index in `seq 3`;
do
  docker logs zookeeper.$index | grep "LEADING - LEADER ELECTION" | cut -f3 -d' '
done
```

# Stopping the cluster

```
./stop-cluster.sh
```

## Read the logs

```
docker logs zookeeper.1
```

## Verify the running image

Zookeeper accepts the "ruok" text on its port (2181) and it replies "imok".

```
echo "ruok" | netcat -q 2 10.0.10.2 2181; echo ", $USER"
```

## Stop and remove the image

```
docker stop zookeeper.2 | xargs docker rm
```

# Docker Utils

I've found the following commands helpful as I experiment with docker. Now thery are easy to find.

## Stop docker processes

```
docker ps -a | grep -v "CONTAINER" | awk '{print $1}' | xargs docker stop
```

## Remove docker processes

```
docker ps -a | grep 'Exited' | awk '{print $1}' | xargs docker rm
```

