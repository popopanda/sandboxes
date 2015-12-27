#!/usr/bin/env bash

yum install -y curl git ntp openssh-clients vim wget

systemctl enable ntp && systemctl start ntp

systemctl disable firewalld && systemctl stop firewalld

sed -i -e 's/^SELINUX=.*/SELINUX=permissive/' /etc/selinux/config

sed -i 's/^\(Defaults.*requiretty\)/# \1/' /etc/sudoers

cat > /etc/sudoers.d/vagrant << VAGRANT
%vagrant ALL=(ALL) NOPASSWD: ALL
VAGRANT

cat > /etc/sysconfig/network-scripts/ifcfg-eth0 << IFCFG_ETHO0
DEVICE=eth0
TYPE=Ethernet
ONBOOT=yes
NM_CONTROLLED=no
BOOTPROTO=dhcp
IFCFG_ETHO0

mkdir /home/vagrant/.ssh && chmod 700 /home/vagrant/.ssh

curl https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub > /home/vagrant/.ssh/authorized_keys

chmod 600 /home/vagrant/.ssh/authorized_keys

chown -R vagrant:vagrant /home/vagrant

rm -f /etc/udev/rules.d/70-persistent-net.rules

yum clean all

rm -fr /tmp/*

rm -f /var/log/wtmp /var/log/btmp

history -c

shutdown -h now