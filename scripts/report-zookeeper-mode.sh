#!/usr/bin/env bash

MODE=$(echo stat | nc localhost 2181 | grep Mode | cut -d ' ' -f 2)

if [ "$MODE" = "follower" ]; then
    echo "This Zookeeper server is a follower."
    exit 0
elif [ "$MODE" = "leader" ]; then
    echo "This Zookeeper server is the leader."
    exit 0
else
    echo "Error: This Zookeeper server is in an unknown state [${MODE}]!"
    exit 1
fi
