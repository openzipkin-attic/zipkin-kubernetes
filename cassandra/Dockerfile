FROM gcr.io/google_containers/cassandra:v5
MAINTAINER Dana NicCaluim <dniccaluim@airware.com>

RUN apt-get update
RUN apt-get install -y procps psmisc

ADD https://raw.githubusercontent.com/openzipkin/zipkin/master/zipkin-cassandra-core/src/main/resources/cassandra-schema-cql3.txt /schema.txt
ADD boot.sh /boot.sh
RUN chmod +x /boot.sh

ENTRYPOINT ["/boot.sh"]

EXPOSE 9160 7000 7001 9042 7199
