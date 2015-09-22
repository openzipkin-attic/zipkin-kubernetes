FROM openzipkin/zipkin-collector:1.9.0

ADD boot.sh /boot.sh
RUN chmod +x /boot.sh

ENTRYPOINT ["/boot.sh"]
