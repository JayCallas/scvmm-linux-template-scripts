#!/bin/bash

# Downloads and launches the Konvoy prep script for Bastion
# ------------------------------------------------------

# Pull down package for unzipping repository
yum -y install unzip

# Get the repository and unzip it
wget https://github.com/JayCallas/scvmm-linux-template-scripts/archive/master.zip
unzip master.zip
cd scvmm-linux-template-scripts-master

# Mark initial script as executable
chmod +x konvoy-bastion-prep.sh

# Remove package for unzipping since is no longer needed
yum -y remove unzip

# Fire the script off
./konvoy-bastion-prep.sh

# Clean up
cd ..
rm -r -f scvmm-linux-template-scripts-master
rm -f master.zip
rm -f launch-konvoy-bastion-prep.sh

# Final reboot to make sure everything is applied
#reboot
