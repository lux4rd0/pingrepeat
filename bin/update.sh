#!/bin/bash

. /opt/ping/etc/$1.conf

OUTPUT=`ping -c 20 -i .1 -w 5 $HOST`
PINGMIN=`echo ${OUTPUT} | grep rtt | awk -F "/" '{ print $4 }' |awk '{print $3}'`
PINGAVG=`echo ${OUTPUT} | grep rtt | awk -F "/" '{ print $5 }'`
PINGMAX=`echo ${OUTPUT} | grep rtt | awk -F "/" '{ print $6 }'`
PINGMDEV=`echo ${OUTPUT} | grep rtt | awk -F "/" '{ print $7 }' |awk '{print $1}'`
PINGLOSS=`echo ${OUTPUT} | grep -oP '\d+(?=% packet loss)'`

if [ -z "${PINGMIN}" ]
then
PINGMIN="0"
fi

if [ -z "${PINGAVG}" ]
then
PINGAVG="0"
fi

if [ -z "${PINGMAX}" ]
then
PINGMAX="0"
fi

if [ -z "${PINGMDEV}" ]
then
PINGMDEV="0"
fi

#echo "PINGMIN:${PINGMIN} PINGAVG:${PINGAVG} PINGMAX:${PINGMAX} PINGMDEV:${PINGMDEV} PINGLOSS:${PINGLOSS}"
#echo "$RRDTOOL update $FILE N:${PINGMIN}:${PINGAVG}:${PINGMAX}:${PINGMDEV}:${PINGLOSS}"

$RRDTOOL update $FILE N:${PINGMIN}:${PINGAVG}:${PINGMAX}:${PINGMDEV}:${PINGLOSS}
