FROM ubuntu
MAINTAINER David Medinets <david.medinets@gmail.com>

# Get add-apt-repository command.
RUN apt-get update
RUN apt-get install -y git maven openjdk-7-jdk
RUN git clone https://github.com/DeemOpen/zkui.git
RUN cd /zkui && mvn clean install
ADD config.cfg /zkui/target/config.cfg

WORKDIR /zkui/target

EXPOSE 9090

ENTRYPOINT [ "java", "-jar", "/zkui/target/zkui-2.0-SNAPSHOT-jar-with-dependencies.jar" ]
