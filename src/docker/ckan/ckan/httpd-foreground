#!/bin/bash
# Apache License 2.0
# https://github.com/docker-library/httpd/blob/master/2.4/httpd-foreground 
set -e

# Apache gets grumpy about PID files pre-existing
rm -f /var/run/httpd/httpd.pid

exec httpd -DFOREGROUND

