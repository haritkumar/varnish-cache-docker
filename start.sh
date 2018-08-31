#!/bin/bash
echo "Starting Varnish cache on port ${VARNISH_PORT}, Backend ${BACKEND_SERVER}:${BACKEND_PORT}"
nohup /usr/sbin/varnishd -j unix,user=varnish -F -f /etc/varnish/default.vcl -a 0.0.0.0:${VARNISH_PORT} -s malloc,${VARNISH_SIZE_GB}g >/dev/null 2>&1 &
sleep 2
/usr/sbin/varnishd -V
echo "Started"
touch /var/log/varnish/access.log
varnishncsa -a -w /var/log/varnish/access.log -D -P /var/run/varnishncsa.pid
echo "------------  Varnish Logs: /var/log/varnish/access.log ------------" > /var/log/varnish/access.log
tail -f /var/log/varnish/access.log