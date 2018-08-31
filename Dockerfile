FROM ubuntu:16.04

ENV BACKEND_SERVER=192.168.0.15 \
    BACKEND_PORT=80 \
    VARNISH_PORT=8080 \
    VARNISH_SIZE_GB=1 \
    VARNISHNCSA_ENABLED=1

ADD install.sh install.sh
RUN chmod +x install.sh && sh ./install.sh && rm install.sh

VOLUME ["/var/lib/varnish", "/etc/varnish"]
EXPOSE 8080

ADD start.sh /start.sh
RUN chmod +x /start.sh

ENTRYPOINT ["/start.sh"]