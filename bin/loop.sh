while true; do /opt/ping/bin/update.sh dns.google; done &
echo $! > /opt/ping/pid/dns.google.pid
while true; do /opt/ping/bin/update.sh gw.pulpfree.net; done &
echo $! > /opt/ping/pid/gw.pulpfree.net.pid
while true; do /opt/ping/bin/update.sh one.one.one.one; done &
echo $! > /opt/ping/pid/one.one.one.one.pid
while true; do /opt/ping/bin/update.sh www.daveschmid.com; done &
echo $! > /opt/ping/pid/www.daveschmid.com.pid
while true; do /opt/ping/bin/update.sh sw-a.pulpfree.net; done &
echo $! > /opt/ping/pid/sw-a.pulpfree.net.pid
while true; do /opt/ping/bin/update.sh sw-b.pulpfree.net; done &
echo $! > /opt/ping/pid/sw-b.pulpfree.net.pid
