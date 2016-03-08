#!/bin/bash
set -e

chown -R cowrie:cowrie /opt/cowrie/log
chown cowrie:cowrie /opt/cowrie/cowrie.cfg
chown -R cowrie:cowrie /opt/cowrie/data/

sed -i 's/AUTHBIND_ENABLED=no/AUTHBIND_ENABLED=yes/' /opt/cowrie/start.sh
sed -i 's/twistd/twistd -n/g' /opt/cowrie/start.sh

new_hostname=`grep -e "^hostname" /opt/cowrie/cowrie.cfg | cut -f 3 -d ' '`

echo $new_hostname > /opt/cowrie/honeyfs/etc/hostname
sed -i "s/127.0.1.1	.*$/127.0.1.1	$new_hostname/" /opt/cowrie/honeyfs/etc/hosts

su -c '/opt/cowrie/start.sh > /opt/cowrie/log/cowrie.out 2> /opt/cowrie/log/cowrie.err' cowrie

