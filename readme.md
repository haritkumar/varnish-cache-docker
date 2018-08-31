# Varnish Cache
Varnish Cache is a web application accelerator also known as a caching HTTP reverse proxy. You install it in front of any server that speaks HTTP and configure it to cache the contents.

## Varnish commands
```sh
whereis varnish
whereis varnishd
varnishncsa [to see realtime logs]
ps aux | grep varnishncsa
/etc/logrotate.d/varnish [For rotational logs]

varnishtop [varnishtop utility reads varnishd shared memory logs and presents a continuously updated list of the most commonly occurring log entries]

varnishstat [varnishstat utility displays statistics from a running varnishd(1) instance]

varnishhist [varnishhist utility reads varnishd(1) shared memory logs and presents a continuously updated histogram showing the distribution of the last N requests by their processing]


```
## Docker commands
```sh
docker build -t vc:1 .
docker run -d -p 8082:8080 --name vc1 vc:1
docker run -it -p 8082:8080 vc:1 bash
```

## varnishd options
```sh
usage: varnishd [options]
    -a address[:port][,proto]    # HTTP listen address and port (default: *:80)
                                 #   address: defaults to loopback
                                 #   port: port or service (default: 80)
                                 #   proto: HTTP/1 (default), PROXY
    -b address[:port]            # backend address and port
                                 #   address: hostname or IP
                                 #   port: port or service (default: 80)
    -C                           # print VCL code compiled to C language
    -d                           # debug
    -F                           # Run in foreground
    -f file                      # VCL script
    -h kind[,hashoptions]        # Hash specification
                                 #   -h critbit [default]
                                 #   -h simple_list
                                 #   -h classic
                                 #   -h classic,<buckets>
    -i identity                  # Identity of varnish instance
    -j jail[,jailoptions]        # Jail specification
                                 #   -j unix[,user=<user>][,ccgroup=<group>]
                                 #   -j none
    -l vsl[,vsm]                 # Size of shared memory file
                                 #   vsl: space for VSL records [80m]
                                 #   vsm: space for stats counters [1m]
    -M address:port              # Reverse CLI destination
    -n dir                       # varnishd working directory
    -P file                      # PID file
    -p param=value               # set parameter
    -r param[,param...]          # make parameter read-only
    -S secret-file               # Secret file for CLI authentication
    -s [name=]kind[,options]     # Backend storage specification
                                 #   -s malloc[,<size>]
                                 #   -s file,<dir_or_file>
                                 #   -s file,<dir_or_file>,<size>
                                 #   -s file,<dir_or_file>,<size>,<granularity>
                                 #   -s persistent (experimental)
    -T address:port              # Telnet listen address and port
    -t TTL                       # Default TTL
    -V                           # version
    -W waiter                    # Waiter implementation
                                 #   -W epoll
                                 #   -W poll
```
