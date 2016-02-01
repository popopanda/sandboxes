#!/usr/bin/env bash

HASHICORP_SOFTWARE=/usr/local/bin/hashicorp
mkdir -p $HASHICORP_SOFTWARE
echo "pathmunge $HASHICORP_SOFTWARE" > /etc/profile.d/hashicorp.sh
chmod a+x /etc/profile.d/hashicorp.sh

PACKER_VERSION=0.8.6
PACKER_ARCHIVE=packer_${PACKER_VERSION}_linux_amd64.zip

wget https://releases.hashicorp.com/packer/$PACKER_VERSION/$PACKER_ARCHIVE

unzip $PACKER_ARCHIVE -d $HASHICORP_SOFTWARE
rm -f $PACKER_ARCHIVE

TERRAFORM_VERSION=0.6.10
TERRAFORM_ARCHIVE=terraform_${TERRAFORM_VERSION}_linux_amd64.zip

wget https://releases.hashicorp.com/terraform/$TERRAFORM_VERSION/$TERRAFORM_ARCHIVE

unzip $TERRAFORM_ARCHIVE -d $HASHICORP_SOFTWARE
rm -f $TERRAFORM_ARCHIVE
