#!/bin/bash

# This script works relative to the repo directory
THIS_DIR=$(cd $(dirname $0); pwd)
cd $THIS_DIR

# create a data directory for the IOC to write to
sudo mkdir -p /data
# create a folder for the IOC to write its OPI files to
sudo mkdir -p /data/opi
sudo chmod -R a+rwx /data

# setup a python virtual environment with the required packages
if [ ! -d venv ]; then
    echo "Creating virtual environment"
    python3 -m venv venv
fi
echo activating python venv
source venv/bin/activate
echo installing python requirements
pip install -r requirements.txt >/dev/null

# use 'ec' to install the IOC in the local docker instance
source ./environment.sh
echo "Deleting previous IOC version if it exists"
echo y | ec delete bl01t-di-cam-01
echo
echo "Deploying the IOC"
echo y | ec deploy-local services/bl01t-di-cam-01

echo
echo "IOC deployed - you should see it in the following 'ec ps' output:"
echo
ec ps

