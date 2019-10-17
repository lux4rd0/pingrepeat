FROM ubuntu:latest
MAINTAINER Dave Schmid

LABEL Description="Ping Worker"

COPY ping-worker.sh /ping-worker.sh

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y apt-utils
RUN apt-get -y install vim rrdtool tzdata inetutils-ping sudo

RUN chmod +x /ping-worker.sh

VOLUME [ "/ping/conf", "/ping/data" ]

CMD [ "/ping-worker.sh" ]
