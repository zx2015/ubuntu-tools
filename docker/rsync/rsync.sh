#!/bin/bash

#Copy configure files to right place
cp -f /config/rsyncd.conf /etc/rsyncd.conf
cp -f /config/rsyncd.secrets /etc/rsyncd.secrets
chmod 600 /etc/rsyncd.secrets

#start rsync service
exec /usr/bin/rsync --no-detach --daemon --config /etc/rsyncd.conf "$@"
