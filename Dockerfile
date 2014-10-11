FROM ubuntu:trusty
MAINTAINER code@patrick-stegmann.de
RUN apt-get update && apt-get -y install software-properties-common && add-apt-repository ppa:webupd8team/java -y && apt-get update
RUN apt-get update && \ 
    (echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections) && \
    apt-get install -y oracle-java8-installer oracle-java8-set-default

ADD spring-boot-docker-cfn-sample.jar /opt/spring-boot-docker-cfn-sample.jar

CMD /usr/bin/java -jar /opt/spring-boot-docker-cfn-sample.jar

EXPOSE 8080

