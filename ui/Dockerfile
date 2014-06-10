FROM ubuntu
MAINTAINER David Medinets <david.medinets@gmail.com>

# Get add-apt-repositoy command.
RUN apt-get update
RUN apt-get install -y git maven openjdk-7-jdk
RUN git clone https://github.com/DeemOpen/zkui.git
RUN cd /zkui && mvn clean install
ADD config.cfg /zkui/target/config.cfg
ADD zkui.sh /

WORKDIR /zkui/target

ENTRYPOINT [ "java", "-jar", "/zkui/target/zkui-2.0-SNAPSHOT-jar-with-dependencies.jar" ]

EXPOSE 9090

