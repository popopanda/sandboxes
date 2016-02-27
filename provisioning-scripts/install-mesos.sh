#!/usr/bin/env bash

rpm -Uvh http://repos.mesosphere.com/el/7/noarch/RPMS/mesosphere-el-repo-7-2.noarch.rpm
yum -y install mesos marathon chronos

CLOUDERA_RPM=cloudera-cdh-5-0.x86_64.rpm

# http://www.cloudera.com/documentation/enterprise/latest/topics/cdh_ig_cdh5_install.html
wget https://archive.cloudera.com/cdh5/one-click-install/redhat/7/x86_64/$CLOUDERA_RPM -O $CLOUDERA_RPM
yum -y --nogpgcheck localinstall $CLOUDERA_RPM
rm -f $CLOUDERA_RPM

# zookeeper-server is needed for the installation of the startup scripts.
yum -y install zookeeper zookeeper-server

systemctl enable zookeeper-server
systemctl start zookeeper-server

# If you are deploying multiple ZooKeeper servers after a fresh install, you need
# to create a myid file in the data directory.
sudo -u zookeeper zookeeper-server-initialize --myid=1

# Marathon is the init/systemd/upstart for Apache Mesos
systemctl enable marathon
systemctl start marathon

# Chronos is the cron for Apache Mesos
systemctl enable chronos
systemctl start chronos
