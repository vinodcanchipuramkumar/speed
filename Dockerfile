FROM ubuntu:22.04
ENV JAVA_HOME=/u02/middleware/jdk-11.0.1
ENV TOMCAT_HOME=/u02/middleware/apache-tomcat-10.1.7
ENV PATH=$PATH:$JAVA_HOME/bin:$TOMCAT_HOME/bin
RUN mkdir -p /u02/middleware
WORKDIR /u02/middleware
ADD https://download.java.net/java/GA/jdk11/13/GPL/openjdk-11.0.1_linux-x64_bin.tar.gz .
ADD https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.7/bin/apache-tomcat-10.1.7.tar.gz .
RUN tar -xzvf openjdk-11.0.1_linux-x64_bin.tar.gz
RUN tar -xzvf apache-tomcat-10.1.7.tar.gz
RUN rm -rf apache-tomcat-10.1.7.tar.gz
RUN rm -rf openjdk-11.0.1_linux-x64_bin.tar.gz
COPY target/speed.war apache-tomcat-10.1.7/webapps
COPY run.sh .
RUN chmod u+x run.sh
ENTRYPOINT [ "./run.sh" ]
CMD [ "tail", "-f", "/dev/null" ]































