FROM ubuntu:latest
MAINTAINER Dave Schmid

LABEL Description="Ping Generate List"

COPY ping-generatelist.sh /ping-generatelist.sh

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y apt-utils
RUN apt-get -y install vim bash sudo

RUN chmod +x /ping-generatelist.sh

VOLUME [ "/ping/conf" ]

CMD [ "/ping-generatelist.sh" ]
