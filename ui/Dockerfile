FROM medined/docker-java-oracle8
MAINTAINER David Medinets <david.medinets@gmail.com>

RUN apt-get install -y git maven 
RUN git clone https://github.com/DeemOpen/zkui.git
RUN cd /zkui && mvn clean install
ADD config.cfg /zkui/target/config.cfg

WORKDIR /zkui/target

EXPOSE 9090

ENTRYPOINT [ "java", "-jar", "/zkui/target/zkui-2.0-SNAPSHOT-jar-with-dependencies.jar" ]
