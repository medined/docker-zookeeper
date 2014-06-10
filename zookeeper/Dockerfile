FROM medined/java-oracle8
MAINTAINER David Medinets <david.medinets@gmail.com>

ADD zookeeper-3.4.6.tar.gz /opt
ADD zoo.cfg /opt/zookeeper-3.4.6/conf/zoo.cfg
RUN mkdir -p /zookeeper/data 

EXPOSE 2181 2888 3888

ENTRYPOINT ["/opt/zookeeper-3.4.6/bin/zkServer.sh"]
CMD ["start-foreground"]

