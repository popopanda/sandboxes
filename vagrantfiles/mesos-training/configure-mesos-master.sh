#!/usr/bin/env bash

while [ $# -ne 0 ]
do
    ARG=$1
    shift
    case $ARG in
    --myid)
        MYID=$1
        shift
        ;;
    *)
        echo "Error: Unknown Argument - $ARG"
        exit 1
        ;;
    esac
done

cat <<EOF > /var/lib/zookeeper/myid
$MYID
EOF

systemctl enable zookeeper
systemctl start zookeeper

# Marathon is the init/systemd/upstart for Apache Mesos
systemctl enable marathon
systemctl start marathon

# Chronos is the cron for Apache Mesos
systemctl enable chronos
systemctl start chronos

systemctl stop mesos-slave.service
systemctl disable mesos-slave.service
