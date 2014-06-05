FROM medined/java-oracle8
MAINTAINER David Medinets <david.medinets@gmail.com>

ADD http://mirror.symnds.com/software/Apache/zookeeper/current/zookeeper-3.4.6.tar.gz /tmp/zookeeper-3.4.6.tar.gz
RUN tar -xzf /tmp/zookeeper-3.4.6.tar.gz -C /opt
RUN cp /opt/zookeeper-3.4.6/conf/zoo_sample.cfg /opt/zookeeper-3.4.6/conf/zoo.cfg

EXPOSE 2181 2888 3888

ENTRYPOINT ["/opt/zookeeper-3.4.6/bin/zkServer.sh"]
CMD ["start-foreground"]

