FROM medined/docker-supervisor
MAINTAINER David Medinets <david.medinets@gmail.com>

ADD . /docker

RUN apt-get update && \
  apt-get install -y software-properties-common && \
  add-apt-repository -y ppa:webupd8team/java && \
  echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections && \
  echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections && \
  apt-get update && apt-get install -y oracle-java8-installer && \
  cp /docker/files/java-env.sh /etc/profile.d/java-env.sh

ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

CMD ["/usr/bin/supervisord", "-n"]
