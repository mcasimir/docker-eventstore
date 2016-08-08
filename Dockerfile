FROM ubuntu:trusty

ENV DEBIAN_FRONTEND=noninteractive \
  EVENTSTORE_INT_HTTP_PREFIXES=http://127.0.0.1:2112/ \
  EVENTSTORE_EXT_HTTP_PREFIXES=http://*:2113/ \
  EVENTSTORE_INT_IP=127.0.0.1 \
  EVENTSTORE_EXT_IP=0.0.0.0 \
  EVENTSTORE_ADD_INTERFACE_PREFIXES=0

RUN apt-get update && apt-get install -y apt-transport-https wget curl && \
  curl -s https://packagecloud.io/install/repositories/EventStore/EventStore-OSS/script.deb.sh | bash

RUN apt-get install -y eventstore-oss=3.8.1

EXPOSE 2113 1113 2112 1112

VOLUME /var/lib/eventstore /var/log/eventstore

ENTRYPOINT ["eventstored", "--log=/var/log/eventstore", "--db=/var/lib/eventstore", "--run-projections=all"]
