#!/usr/bin/env bash

sed -i "s|%MYID%|$MYID|" /etc/consul.d/zookeeper-health-check.json
