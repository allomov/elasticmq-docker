FROM       ubuntu:16.04
MAINTAINER Aliaksandr Lomau
ARG version

RUN apt-get update && apt-get install default-jre -y

ADD  https://s3-eu-west-1.amazonaws.com/softwaremill-public/elasticmq-server-${version}.jar /elasticmq/elasticmq-server.jar
ADD  elasticmq.conf /elasticmq/elasticmq.conf
ADD  localhost.conf /elasticmq/localhost.conf
ADD  custom.conf /elasticmq/custom.conf
ADD  run /elasticmq/run
RUN  chmod +x /elasticmq/run

EXPOSE 9324

ENTRYPOINT ["/elasticmq/run"]
CMD        []
