#!/usr/bin/env bash

mv /tmp/web-server-health-check.json /etc/consul.d/web-server-health-check.json

mv /tmp/start-consul-client.sh /usr/local/bin/start-consul-client.sh
chmod a+x /usr/local/bin/start-consul-client.sh

mv /tmp/consul-client.service /etc/systemd/system/consul.service

mkdir -p /etc/consul-template
mv /tmp/index.html.ctmpl /etc/consul-template/index.html.ctmpl

mv /tmp/consul-template.service /etc/systemd/system/consul-template.service
