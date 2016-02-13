#!/usr/bin/env bash

exec /usr/local/bin/hashicorp/consul-template \
  -log-level=debug \
  -template=/etc/consul-template/index.html.ctmpl:/var/www/html/index.html \
  >> /var/log/consul-template.log 2>&1
