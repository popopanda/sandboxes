#!/usr/bin/env bash

rpm -Uvh http://repos.mesosphere.com/el/7/noarch/RPMS/mesosphere-el-repo-7-2.noarch.rpm
yum -y install mesos marathon chronos

CLOUDERA_RPM=cloudera-cdh-5-0.x86_64.rpm

# http://www.cloudera.com/documentation/enterprise/latest/topics/cdh_ig_cdh5_install.html
wget https://archive.cloudera.com/cdh5/one-click-install/redhat/7/x86_64/$CLOUDERA_RPM -O $CLOUDERA_RPM
yum -y --nogpgcheck localinstall $CLOUDERA_RPM
rm -f $CLOUDERA_RPM

yum -y install zookeeper zookeeper-server
sudo -u zookeeper zookeeper-server-initialize --myid=1

systemctl enable chronos
systemctl enable marathon
systemctl enable zookeeper-server

systemctl start chronos
systemctl start marathon
systemctl start zookeeper-server
