FROM medined/docker-java-oracle7
MAINTAINER David Medinets <david.medinets@gmail.com>

ADD http://mirror.symnds.com/software/Apache/zookeeper/current/zookeeper-3.4.6.tar.gz /
RUN cd /usr/lib && \
  tar xfz /zookeeper-3.4.6.tar.gz && \
  rm /zookeeper-3.4.6.tar.gz

ADD . /docker
