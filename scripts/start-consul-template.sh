#!/usr/bin/env bash

exec /usr/local/bin/start-consul-template.sh \
  -template=/etc/consul-template/index.html.ctmpl:/var/www/html/index.html
