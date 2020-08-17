#!/bin/bash

# Standard Linux System Prep
# ------------------------------------------------------

# Update everything from Yum to the latest version
yum clean all
yum makecache
yum -y update

# Reboot will be needed
# May make sense to add flag to this script