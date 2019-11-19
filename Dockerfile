FROM ubuntu:trusty
RUN apt-get update
RUN apt-get install default-jre -y
RUN apt-get install default-jdk -y
RUN echo 'JAVA_HOME="/usr/lib/jvm/java-7-openjdk-amd64/bin"' >> /etc/environment
RUN echo 'classpath="/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/ext"' >> /etc/environment
RUN /bin/bash -c "source /etc/environment"
COPY myproject1.jar /var/www/html/myproject1.jar
RUN chmod 777 /var/www/html/*
ENTRYPOINT cd /var/www/html && java -jar myproject1.jar $PORT1 > mylogfile.log && /bin/bash
