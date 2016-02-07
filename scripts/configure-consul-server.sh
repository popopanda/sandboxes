#!/usr/bin/env bash

echo "ATLAS_ENVIRONMENT=${ATLAS_ENVIRONMENT}" | sudo tee -a /etc/service/consul
echo "ATLAS_TOKEN=${ATLAS_CONSUL_TOKEN}" | sudo tee -a /etc/service/consul
echo "NODE_NAME=web-${CONSUL_SERVERS}" | sudo tee -a /etc/service/consul

sudo service consul restart
