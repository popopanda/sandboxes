#!/usr/bin/env bash

APPLICATION=consul
VERSION=0.6.3
ARCHIVE=${APPLICATION}_${VERSION}_linux_amd64.zip

wget https://releases.hashicorp.com/$APPLICATION/$VERSION/$ARCHIVE

unzip $ARCHIVE -d /usr/local/bin/hashicorp
rm -f $ARCHIVE

sudo mkdir -p /etc/consul.d
sudo mkdir -p /mnt/consul
touch /etc/sysconfig/consul
