#!/bin/bash

# Downloads and launches the Konvoy prep script
# ------------------------------------------------------

# Pull down package for unzipping repository
yum -y install unzip

# Get the repository and unzip it
wget https://github.com/JayCallas/scvmm-linux-tempate-scripts/archive/master.zip
unzip master.zip
cd scvmm-linux-tempate-scripts

# Mark initial script as executable
chmod +x konvoy-prep.sh

# Remove package for unzipping since is no longer needed
yum -y remove unzip

# Fire the script off
./konvoy-prep.sh

# Clean up
cd ..
rm -r scvmm-linux-tempate-scripts
rm master.zip
rm launch-konvoy-prep.sh

# Final reboot to make sure everything is applied
reboot
