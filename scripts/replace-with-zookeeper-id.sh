#!/usr/bin/env bash

exec sed -i "s|%MYID%|$MYID|" /etc/consul.d/zookeeper-health-check.json
