FROM medined/docker-java-oracle8
MAINTAINER David Medinets <david.medinets@gmail.com>

# Source: https://www.digitalocean.com/community/articles/how-to-install-java-on-ubuntu-with-apt-get

ADD http://mirror.symnds.com/software/Apache/zookeeper/current/zookeeper-3.4.6.tar.gz /opt/
RUN cd /opt && \
  tar xfz /opt/zookeeper-3.4.6.tar.gz && \
  rm /opt/zookeeper-3.4.6.tar.gz

ADD zoo.cfg /opt/zookeeper-3.4.6/conf/zoo.cfg
RUN mkdir -p /zookeeper/data 

ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
ENV ZOOKEEPER_DATA_DIR /zookeeper/data

ADD pipework           /pipework
ADD start-zookeeper.sh /start-zookeeper.sh

EXPOSE 2181 2888 3888

ENTRYPOINT ["/start-zookeeper.sh"]
