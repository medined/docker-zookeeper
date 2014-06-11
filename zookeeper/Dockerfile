FROM docker/java-oracle8
MAINTAINER David Medinets <david.medinets@gmail.com>

ADD zookeeper-3.4.6.tar.gz /opt
ADD zoo.cfg /opt/zookeeper-3.4.6/conf/zoo.cfg
RUN mkdir -p /zookeeper/data 

ENV ZOOKEEPER_DATA_DIR /zookeeper/data

ADD start-zookeeper.sh /start-zookeeper.sh

EXPOSE 2181 2888 3888

ENTRYPOINT ["/start-zookeeper.sh"]
