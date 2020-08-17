#!/bin/bash

# System Prep for Commvault systems
# ------------------------------------------------------

# Configure NTP
yum -y install ntp

systemctl enable ntpd
systemctl start ntpd

# Configure SNMP for LogicMonitor
yum install -y net-snmp net-snmp-utils

service snmpd stop
net-snmp-create-v3-user -ro -A BATS_authPass -X BATS_privPass -a SHA -x AES BATS_snmpv3user

systemctl enable snmpd.service
systemctl restart snmpd.service
