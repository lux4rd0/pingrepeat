#!/bin/bash

#CONFPATH="/mnt/docker/ping/conf"
CONFPATH="/ping/conf"

#DATAPATH="/mnt/docker/ping/data"
DATAPATH="/ping/data"

UNIQUEHOSTNAME=`sed -rn '1s#.*/##; 1s/(.{12}).*/\1/p' /proc/self/cgroup`

while [ true ]; do

touch ${CONFPATH}/worker.${UNIQUEHOSTNAME}.uniquehostid

while [ ! -f ${CONFPATH}/worker.ping-hosts.${UNIQUEHOSTNAME}.txt ];
do
    touch ${CONFPATH}/worker.${UNIQUEHOSTNAME}.uniquehostid
    echo "Queue Host File Not Found - Sleeping"
    sleep 1;
done;

echo "Found Queue Host File"

cat ${CONFPATH}/worker.ping-hosts.${UNIQUEHOSTNAME}.txt | while read line

do

RRDCACHED=`cat ${DATAPATH}/conf/rrdcached.host`

echo "`date` - start ping"

OUTPUT=`timeout 2 ping -c 10 -i .1 -q ${line}`
PINGMIN=`echo ${OUTPUT} | grep round-trip | awk -F "/" '{ print $4 }' |awk '{print $3}'`
PINGAVG=`echo ${OUTPUT} | grep round-trip | awk -F "/" '{ print $5 }'`
PINGMAX=`echo ${OUTPUT} | grep round-trip | awk -F "/" '{ print $6 }'`
PINGMDEV=`echo ${OUTPUT} | grep round-trip | awk -F "/" '{ print $7 }' |awk '{print $1}'`
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

echo "`date` - end ping"

RRDCHECK=`/usr/bin/rrdtool list --daemon ${RRDCACHED}:42217 / | grep -c ${line}.rrd`

if [[ ${RRDCHECK} == 0 ]]; then
  echo "${line}.rrd not found - creating RRD";

/usr/bin/rrdtool create --daemon ${RRDCACHED}:42217 ${line}.rrd -s 1 \
DS:PINGMIN:GAUGE:10:0:3932100 \
DS:PINGAVG:GAUGE:10:0:3932100 \
DS:PINGMAX:GAUGE:10:0:3932100 \
DS:PINGMDEV:GAUGE:10:0:3932100 \
DS:PINGLOSS:GAUGE:10:0:3932100 \
RRA:AVERAGE:0.5:1:144000 \
RRA:AVERAGE:0.5:60:20160 \
RRA:AVERAGE:0.5:300:8640

echo "${line}.rrd file created"

fi

echo "`date` - start RRD update"
echo "/usr/bin/rrdtool update --daemon ${RRDCACHED}:42217 ${line}.rrd N:${PINGMIN}:${PINGAVG}:${PINGMAX}:${PINGMDEV}:${PINGLOSS}"
/usr/bin/rrdtool update --daemon ${RRDCACHED}:42217 ${line}.rrd N:${PINGMIN}:${PINGAVG}:${PINGMAX}:${PINGMDEV}:${PINGLOSS}

echo "`date` - complete RRD update"

done

done
