# syntax=docker/dockerfile:1
FROM ubuntu:20.04 AS buildapp
ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get -y update && apt-get install -y \
    default-jdk \
    git \
    maven
WORKDIR /tmp/
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git 
WORKDIR /tmp/boxfuse-sample-java-war-hello/
RUN mvn package


FROM tomcat:9.0.0.M19-alpine
COPY --from=buildapp /tmp/boxfuse-sample-java-war-hello/target/hello-1.0.war ./webapps/