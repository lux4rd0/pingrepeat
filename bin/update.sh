#!/bin/bash

. /opt/ping/etc/$1.conf

OUTPUT=`ping -c 20 -i .1 -w 5 $HOST`
PINGMIN=`echo ${OUTPUT} | grep rtt | awk -F "/" '{ print $4 }' |awk '{print $3}'`
PINGAVG=`echo ${OUTPUT} | grep rtt | awk -F "/" '{ print $5 }'`
PINGMAX=`echo ${OUTPUT} | grep rtt | awk -F "/" '{ print $6 }'`
PINGMDEV=`echo ${OUTPUT} | grep rtt | awk -F "/" '{ print $7 }' |awk '{print $1}'`
PINGLOSS=`echo ${OUTPUT} | grep -oP '\d+(?=% packet loss)'`

#echo "PINGMIN:${PINGMIN} ${PINGAVG}:PINGAVG PINGMAX:${PINGMAX} PINGMDEV:${PINGMDEV} PINGLOSS:${PINGLOSS}"
#echo "$RRDTOOL update $FILE N:${PINGMIN}:${PINGAVG}:${PINGMAX}:${PINGMDEV}:${PINGLOSS}"

$RRDTOOL update $FILE N:${PINGMIN}:${PINGAVG}:${PINGMAX}:${PINGMDEV}:${PINGLOSS}
