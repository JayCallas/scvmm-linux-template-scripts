#!/bin/bash

# Downloads and launches the Konvoy prep script for Nodes (Master and Worker)
# ------------------------------------------------------

# Pull down package for unzipping repository
yum -y install unzip

# Get the repository and unzip it
wget https://github.com/JayCallas/scvmm-linux-template-scripts/archive/master.zip
unzip master.zip
cd scvmm-linux-template-scripts-master

# Mark initial script as executable
chmod +x konvoy-node-prep.sh

# Remove package for unzipping since is no longer needed
yum -y remove unzip

# Fire the script off
./konvoy-node-prep.sh

# Clean up
cd ..
rm -r -f scvmm-linux-template-scripts-master
rm -f master.zip
rm -f launch-konvoy-node-prep.sh

# Final reboot to make sure everything is applied
#reboot
