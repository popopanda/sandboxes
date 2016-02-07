#!/usr/bin/env bash

APPLICATION=consul
VERSION=0.6.3
ARCHIVE=${APPLICATION}_${VERSION}_linux_amd64.zip

wget https://releases.hashicorp.com/$APPLICATION/$VERSION/$ARCHIVE

unzip $ARCHIVE -d /usr/local/bin/hashicorp
rm -f $ARCHIVE

sudo mkdir -p /etc/consul.d
sudo mkdir -p /mnt/consul
sudo mkdir -p /etc/service

for FILENAME in $(find /tmp -iname '*.sh' -type f); do
  FILENAME=$(basename $FILENAME)
  sudo mv "/tmp/${FILENAME}" "/usr/local/bin/${FILENAME}"
done

sudo mv /tmp/consul.conf /etc/init/consul.conf
