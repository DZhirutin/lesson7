FROM ubuntu:20.04
ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get -y update && apt-get install -y \
    default-jdk \
    git \
    maven
#RUN mkdir /usr/local/tomcat
#RUN wget https://downloads.apache.org/tomcat/tomcat-9/v9.0.46/bin/apache-tomcat-9.0.46.tar.gz -O /tmp/tomcat.tar.gz
#RUN cd /tmp && tar xvfz tomcat.tar.gz
#RUN cp -Rv /tmp/apache-tomcat-9.0.46/* /usr/local/tomcat/
WORKDIR /tmp/
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git 
WORKDIR /tmp/boxfuse-sample-java-war-hello/
RUN mvn package
CMD ["/bin/bash"]
#RUN cp /tmp/boxfuse-sample-java-war-hello/target/hello-1.0.war /home/app/
#CMD /usr/local/tomcat/bin/catalina.sh run