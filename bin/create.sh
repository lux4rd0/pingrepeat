#!/bin/bash

echo "#!/bin/bash" > /opt/ping/etc/$1.conf
echo "RRDTOOL='/usr/bin/rrdtool'" >> /opt/ping/etc/$1.conf
echo "HOST='$1'" >> /opt/ping/etc/$1.conf
echo "FILE='/opt/ping/db/$1.rrd'" >> /opt/ping/etc/$1.conf
echo "OUTPUT='/var/www/html/ping/$1'" >> /opt/ping/etc/$1.conf

/usr/bin/rrdtool create /opt/ping/db/$1.rrd -s 1 \
DS:PINGMIN:GAUGE:10:0:3932100 \
DS:PINGAVG:GAUGE:10:0:3932100 \
DS:PINGMAX:GAUGE:10:0:3932100 \
DS:PINGMDEV:GAUGE:10:0:3932100 \
DS:PINGLOSS:GAUGE:10:0:3932100 \
RRA:AVERAGE:0.5:1:144000 \
RRA:AVERAGE:0.5:60:20160 \
RRA:AVERAGE:0.5:300:8640
