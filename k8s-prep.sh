#!/bin/bash

# Kubernetes System Prep
# ------------------------------------------------------

# Disable SELinux
setenforce 0
sed -i --follow-symlinks 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux

# Disable swap
swapoff -a
sed -i --follow-symlinks 's/^\/dev\/mapper\/centos-swap/#&/' /etc/fstab

# Set up firewall rules to ensure cluster communications
firewall-cmd --permanent --add-port=6443/tcp
firewall-cmd --permanent --add-port=2379-2380/tcp
firewall-cmd --permanent --add-port=10250/tcp
firewall-cmd --permanent --add-port=10251/tcp
firewall-cmd --permanent --add-port=10252/tcp
firewall-cmd --permanent --add-port=10255/tcp
firewall-cmd --reload

# alternatively...
# Disable firewall to ensure cluster communications
systemctl stop firewalld
systemctl disable firewalld

# Enable br_netfilter
modprobe br_netfilter
echo '1' > /proc/sys/net/bridge/bridge-nf-call-iptables

# Custom steps
sh ./standard-prep.sh

# Reboot will be needed
# May make sense to add flag to this script