#!/bin/bash

# Kubernetes prep for Konvoy (bastion)
# ------------------------------------------------------

# Disable SELinux
setenforce 0
sed -i --follow-symlinks 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux

# Add some needed packages
yum -y install yum-utils

# Add Docker repo and packages
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo 

yum -y install docker-ce docker-ce-cli

# Add K8s repo and packages
cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF

yum install -y kubectl

# Needed to uncompress konvoy package
yum -y install bzip2

# Custom steps
sh ./standard-prep.sh