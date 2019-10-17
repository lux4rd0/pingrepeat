#!/bin/bash

## Create container queue list

#CONFPATH="/mnt/docker/ping/conf"
CONFPATH="/ping/conf"

while [ true ]; do

PINGHOSTS="${CONFPATH}/ping-hosts.txt"

ENTRIES=`cat ${PINGHOSTS} | wc -l`

find ${CONFPATH}/worker.*.uniquehostid -mmin -1 | egrep '.*' | awk -F'/' '{print $NF}' |awk -F\. '{print $2}' > ${CONFPATH}/worker.ping-uniquehostids.list
find ${CONFPATH}/grapher.*.uniquehostid -mmin -1 | egrep '.*' | awk -F'/' '{print $NF}' |awk -F\. '{print $2}' > ${CONFPATH}/grapher.ping-uniquehostids.list

find ${CONFPATH}/worker.ping-hosts.*.txt -mmin +1 -type f -exec rm -fv {} \;
find ${CONFPATH}/grapher.ping-hosts.*.txt -mmin +1 -type f -exec rm -fv {} \;

find ${CONFPATH}/grapher.*.uniquehostid -mmin +1 -type f -exec rm -fv {} \;
find ${CONFPATH}/worker.*.uniquehostid -mmin +1 -type f -exec rm -fv {} \;

ENTRIESWORKER=`cat ${CONFPATH}/worker.ping-uniquehostids.list | wc -l`
ENTRIESGRAPHER=`cat ${CONFPATH}/grapher.ping-uniquehostids.list | wc -l`

COUNTER=0

cat ${CONFPATH}/worker.ping-uniquehostids.list | while read line

do

echo "cat ${PINGHOSTS} | sed -n "${COUNTER}~${ENTRIESWORKER}p" > ${CONFPATH}/worker.ping-hosts.${line}.txt"

cat ${PINGHOSTS} | sed -n "${COUNTER}~${ENTRIESWORKER}p" > ${CONFPATH}/worker.ping-hosts.${line}.txt

((COUNTER++))

done

COUNTER=0

cat ${CONFPATH}/grapher.ping-uniquehostids.list | while read line

do

echo "cat ${PINGHOSTS} | sed -n "${COUNTER}~${ENTRIESGRAPHER}p" > ${CONFPATH}/grapher.ping-hosts.${line}.txt"

cat ${PINGHOSTS} | sed -n "${COUNTER}~${ENTRIESGRAPHER}p" > ${CONFPATH}/grapher.ping-hosts.${line}.txt

((COUNTER++))

done

sleep 30

done
