#!/usr/bin/env bash

HASHICORP_DIR=/usr/local/bin/hashicorp
mkdir -p $HASHICORP_DIR
echo "pathmunge $HASHICORP_DIR after" > /etc/profile.d/hashicorp.sh
chmod a+x /etc/profile.d/hashicorp.sh
