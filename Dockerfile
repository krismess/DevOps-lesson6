FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install -y default-jdk
RUN apt-get install -y git
RUN apt-get install -y maven
RUN apt-get install -y wget
RUN wget http://apache-mirror.rbc.ru/pub/apache/tomcat/tomcat-8/v8.5.49/bin/apache-tomcat-8.5.49.tar.gz
RUN tar xvzf apache-tomcat-8.5.49.tar.gz -C /usr/local
ENV CATALINA_HOME /usr/local/apache-tomcat-8.5.49/
ENV PATH $CATALINA_HOME/bin:$PATH
EXPOSE 8080
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello
RUN cd boxfuse-sample-java-war-hello && mvn package && cp target/hello-1.0.war /usr/local/apache-tomcat-8.5.49/webapps
CMD ["catalina.sh", "run"]

