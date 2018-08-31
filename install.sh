#!/bin/bash

apt-get -y update
apt-get -y install varnish lsof net-tools curl iputils-ping vim

tee /etc/varnish/default.vcl <<EOF
vcl 4.0;
backend default {
    .host = "$BACKEND_SERVER";
    .port = "$BACKEND_PORT";
}
EOF

touch /etc/varnish/secret