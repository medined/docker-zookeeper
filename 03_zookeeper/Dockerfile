FROM medined/docker-java-oracle:8
MAINTAINER David Medinets <david.medinets@gmail.com>

RUN /usr/sbin/useradd --create-home --home-dir /home/zookeeper --shell /bin/bash zookeeper

ADD . /docker

# Make data directory referenced in zoo.cfg
RUN mkdir -p /zookeeper/data

ADD http://mirror.symnds.com/software/Apache/zookeeper/current/zookeeper-3.4.6.tar.gz /
RUN cd /usr/lib && \
  tar xfz /zookeeper-3.4.6.tar.gz && \
  rm /zookeeper-3.4.6.tar.gz && \
  cp /docker/files/supervisor-zookeeper.conf /etc/supervisor/conf.d/supervisor-zookeeper.conf && \
  cp /docker/files/zoo.cfg /usr/lib/zookeeper-3.4.6/conf/zoo.cfg && \
  chown -R zookeeper:zookeeper /usr/lib/zookeeper-3.4.6 /zookeeper && \
  ln -s /usr/lib/zookeeper-3.4.6 /usr/lib/zookeeper


ENV ZOOKEEPER_DATA_DIR /zookeeper/data

EXPOSE 2181 2888 3888

