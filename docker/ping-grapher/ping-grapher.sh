#!/bin/bash

#CONFPATH="/mnt/docker/ping/conf"
CONFPATH="/ping/conf"

#DATAPATH="/mnt/docker/ping/data"
DATAPATH="/ping/data"

UNIQUEHOSTNAME=`sed -rn '1s#.*/##; 1s/(.{12}).*/\1/p' /proc/self/cgroup`

#UNIQUEHOSTNAME="fcbf61559721"

while [ true ]; do

touch ${CONFPATH}/grapher.${UNIQUEHOSTNAME}.uniquehostid

while [ ! -f ${CONFPATH}/grapher.ping-hosts.${UNIQUEHOSTNAME}.txt ];
do
    touch ${CONFPATH}/grapher.${UNIQUEHOSTNAME}.uniquehostid
    echo "Queue Host File Not Found - Sleeping"
    sleep 1;
done;

echo "Found Queue Host File"

sleep 1;

cat ${CONFPATH}/grapher.ping-hosts.${UNIQUEHOSTNAME}.txt | while read line

do

RRDCACHED=`cat ${DATAPATH}/conf/rrdcached.host`

echo "`date` - start graph ${line}"

/graph.sh ${line}

echo "`date` - end graph ${line}"

done

done
