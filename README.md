
# Build the image

```
docker build -t medined/oracle8-zookeeper-3-4-6 .
```

# See the image

```
docker images
```

# Run the image

```
ZOOKEEPER=$(docker run -d -p 2181:2181  -t medined/oracle8-zookeeper-3-4-6)
```

# Read the logs

```
docker logs $ZOOKEEPER
```
