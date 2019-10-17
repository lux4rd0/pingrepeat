FROM ubuntu:latest
MAINTAINER Dave Schmid

LABEL Description="Ping Grapher"

COPY ping-grapher.sh /ping-grapher.sh
COPY graph.sh /graph.sh
COPY ./fonts/ /usr/share/fonts/

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y apt-utils
RUN apt-get -y install vim rrdtool tzdata sudo

RUN chmod +x /ping-grapher.sh
RUN chmod +x /graph.sh
RUN fc-cache

VOLUME [ "/ping/conf", "/ping/data", "/ping/www" ]

CMD [ "/ping-grapher.sh" ]
