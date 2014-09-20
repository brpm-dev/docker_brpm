FROM centos
MAINTAINER Niek Bartholomeus "niek.bartholomeus@gmail.com"

RUN yum install -y nano unzip
RUN yum install -y java-1.7.0
RUN yum install -y tomcat6 tomcat6-webapps tomcat6-admin-webapps 

VOLUME ["/var/log"]

EXPOSE 8080

ENV BRPM_VERSION 1.0.0

RUN wget http://brpm.pulsar-it.be:29419/software-repo/DockerizedBRPM/Application/$BRPM_VERSION/brpm.war

RUN mkdir -p /var/lib/tomcat6/webapps/brpm
RUN unzip brpm.war -d /var/lib/tomcat6/webapps/brpm
RUN chgrp -R tomcat /var/lib/tomcat6/webapps/brpm

ADD . /

RUN mv /source-files/database.yml /usr/share/tomcat6/webapps/brpm/WEB-INF/config
RUN chmod +x /source-files/*.sh

CMD ["/source-files/start.sh"]
