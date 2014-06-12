FROM ubuntu
MAINTAINER David Medinets <david.medinets@gmail.com>

# Source: https://www.digitalocean.com/community/articles/how-to-install-java-on-ubuntu-with-apt-get

# Get add-apt-repositoy command.
RUN apt-get update
RUN apt-get install -y software-properties-common

# Add Oracle Java repository.
RUN add-apt-repository -y ppa:webupd8team/java

# Add flag file to automate Oracle Java installation
RUN echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
RUN echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections

# Install Oracle Java
RUN apt-get update && apt-get install -y oracle-java8-installer

ADD zookeeper-3.4.6.tar.gz /opt
ADD zoo.cfg /opt/zookeeper-3.4.6/conf/zoo.cfg
RUN mkdir -p /zookeeper/data 

ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
ENV ZOOKEEPER_DATA_DIR /zookeeper/data

ADD start-zookeeper.sh /start-zookeeper.sh

EXPOSE 2181 2888 3888

ENTRYPOINT ["/start-zookeeper.sh"]
