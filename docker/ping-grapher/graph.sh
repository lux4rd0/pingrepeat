#!/bin/sh

HOST=$1
#CONFPATH="/mnt/docker/ping/conf"
CONFPATH="/ping/conf"

#WWWPATH="/mnt/docker/ping/www/html/images"
WWWPATH="/ping/www/html/images"

#RRDCACHED=`cat /mnt/docker/ping/data/conf/rrdcached.host`
RRDCACHED=`cat /ping/data/conf/rrdcached.host`

cat ${CONFPATH}/grapher-minutes.txt | while read line

do

RRDSECONDS=`expr ${line} \* 60`
RRDMINUTESPAD=`printf "%04d\n" ${line}`

echo "/usr/bin/rrdtool graph --daemon ${RRDCACHED}:42217 ${WWWPATH}/${HOST}-${RRDMINUTESPAD}m.png"

/usr/bin/rrdtool graph --daemon ${RRDCACHED}:42217 "${WWWPATH}/${HOST}-${RRDMINUTESPAD}m.png" \
         -t "${HOST} Ping Times - ${line} Minutes" -v "Time in ms" \
         --start="now-${RRDSECONDS}s" \
         --end="now" \
         --height="125" \
         --width="650" \
         --imgformat=PNG \
         -c "BACK#000000" \
         -c "SHADEA#000000" \
         -c "SHADEB#000000" \
         -c "FONT#DDDDDD" \
         -c "CANVAS#202020" \
         -c "GRID#666666" \
         -c "MGRID#AAAAAA" \
         -c "FRAME#202020" \
         -c "ARROW#FFFFFF" \
        --border 1 --font TITLE:16:'Queenie'\''s' \
        --font AXIS:12:'CopprplGoth Cn BT' \
        --font LEGEND:10:'monofur Regular' \
        --font UNIT:12:'CopprplGoth Cn BT' \
        --pango-markup  \
         "DEF:a=${HOST}.rrd:PINGAVG:MAX" \
         "DEF:b=${HOST}.rrd:PINGMIN:MAX" \
         "DEF:c=${HOST}.rrd:PINGMAX:MAX" \
         "DEF:d=${HOST}.rrd:PINGMDEV:MAX" \
         "DEF:e=${HOST}.rrd:PINGLOSS:MAX" \
         "CDEF:cdefbd=e,-1,*" \
         "AREA:a#990099#ffff00:Average       ":gradheight=0 \
         "GPRINT:a:LAST:Last\: %5.2lf ms" \
         "GPRINT:a:MIN:Min\: %5.2lf ms" \
         "GPRINT:a:MAX:Max\: %5.2lf ms" \
         "GPRINT:a:AVERAGE:Avg\: %5.2lf ms\n" \
         "LINE:b#000000:Minimum       " \
         "GPRINT:b:LAST:Last\: %5.2lf ms" \
         "GPRINT:b:MIN:Min\: %5.2lf ms" \
         "GPRINT:b:MAX:Max\: %5.2lf ms" \
         "GPRINT:b:AVERAGE:Avg\: %5.2lf ms\n" \
         "LINE:c#ffff00:Maximum       " \
         "GPRINT:c:LAST:Last\: %5.2lf ms" \
         "GPRINT:c:MIN:Min\: %5.2lf ms" \
         "GPRINT:c:MAX:Max\: %5.2lf ms" \
         "GPRINT:c:AVERAGE:Avg\: %5.2lf ms\n" \
         "LINE:d#990099:Mean Deviation" \
         "GPRINT:d:LAST:Last\: %5.2lf ms" \
         "GPRINT:d:MIN:Min\: %5.2lf ms" \
         "GPRINT:d:MAX:Max\: %5.2lf ms" \
         "GPRINT:d:AVERAGE:Avg\: %5.2lf ms\n" \
         "AREA:cdefbd#ff0000:% Packet Loss " \
         "GPRINT:e:LAST:Last\: %5.2lf ms" \
         "GPRINT:e:MIN:Min\: %5.2lf ms" \
         "GPRINT:e:MAX:Max\: %5.2lf ms" \
         "GPRINT:e:AVERAGE:Avg\: %5.2lf ms\n" >/dev/null

done
