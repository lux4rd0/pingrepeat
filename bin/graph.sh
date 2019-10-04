#!/bin/bash 
 
 . /opt/ping/etc/$1.conf

 $RRDTOOL graph "$OUTPUT"-0005m.png \
         -t "${HOST} Ping Times - 5 Minutes" -v "Time in ms" \
         --start="now-300s" \
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
         "DEF:a=$FILE:PINGAVG:MAX" \
         "DEF:b=$FILE:PINGMIN:MAX" \
         "DEF:c=$FILE:PINGMAX:MAX" \
         "DEF:d=$FILE:PINGMDEV:MAX" \
         "DEF:e=$FILE:PINGLOSS:MAX" \
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

 $RRDTOOL graph "$OUTPUT"-0010m.png \
         -t "${HOST} Ping Times - 10 Minutes" -v "Time in ms" \
         --start="now-10m" \
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
         "DEF:a=$FILE:PINGAVG:MAX" \
         "DEF:b=$FILE:PINGMIN:MAX" \
         "DEF:c=$FILE:PINGMAX:MAX" \
         "DEF:d=$FILE:PINGMDEV:MAX" \
         "DEF:e=$FILE:PINGLOSS:MAX" \
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

 $RRDTOOL graph "$OUTPUT"-0020m.png \
         -t "${HOST} Ping Times - 20 Minutes" -v "Time in ms" \
         --start="now-20m" \
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
         "DEF:a=$FILE:PINGAVG:MAX" \
         "DEF:b=$FILE:PINGMIN:MAX" \
         "DEF:c=$FILE:PINGMAX:MAX" \
         "DEF:d=$FILE:PINGMDEV:MAX" \
         "DEF:e=$FILE:PINGLOSS:MAX" \
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

 $RRDTOOL graph "$OUTPUT"-0060m.png \
         -t "${HOST} Ping Times - 60 Minutes" -v "Time in ms" \
         --start="now-60m" \
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
         "DEF:a=$FILE:PINGAVG:MAX" \
         "DEF:b=$FILE:PINGMIN:MAX" \
         "DEF:c=$FILE:PINGMAX:MAX" \
         "DEF:d=$FILE:PINGMDEV:MAX" \
         "DEF:e=$FILE:PINGLOSS:MAX" \
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

 $RRDTOOL graph "$OUTPUT"-0120m.png \
         -t "${HOST} Ping Times - 2 Hours" -v "Time in ms" \
         --start="now-120m" \
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
         "DEF:a=$FILE:PINGAVG:MAX" \
         "DEF:b=$FILE:PINGMIN:MAX" \
         "DEF:c=$FILE:PINGMAX:MAX" \
         "DEF:d=$FILE:PINGMDEV:MAX" \
         "DEF:e=$FILE:PINGLOSS:MAX" \
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

 $RRDTOOL graph "$OUTPUT"-0360m.png \
         -t "${HOST} Ping Times - 6 Hours" -v "Time in ms" \
         --start="now-360m" \
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
         "DEF:a=$FILE:PINGAVG:MAX" \
         "DEF:b=$FILE:PINGMIN:MAX" \
         "DEF:c=$FILE:PINGMAX:MAX" \
         "DEF:d=$FILE:PINGMDEV:MAX" \
         "DEF:e=$FILE:PINGLOSS:MAX" \
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

 $RRDTOOL graph "$OUTPUT"-1440m.png \
         -t "${HOST} Ping Times - 1 Day" -v "Time in ms" \
         --start="now-1440m" \
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
         "DEF:a=$FILE:PINGAVG:MAX" \
         "DEF:b=$FILE:PINGMIN:MAX" \
         "DEF:c=$FILE:PINGMAX:MAX" \
         "DEF:d=$FILE:PINGMDEV:MAX" \
         "DEF:e=$FILE:PINGLOSS:MAX" \
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
