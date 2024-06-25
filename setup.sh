#!/bin/bash

# This script works relative to the repo directory
THIS_DIR=$(cd $(dirname $0); pwd)
cd $THIS_DIR

# create a data directory for the IOC to write to
sudo mkdir -p /data
sudo rm -rf /data/*
# create a folder for the IOC to write its OPI files to
sudo mkdir -p /data/opi
sudo rm -rf /data/opi/*
sudo chmod -R a+rwx /data

# setup a python virtual environment with the required packages
if [ ! -d venv ]; then
    echo "Creating virtual environment"
    python3 -m venv venv
fi
source venv/bin/activate
pip install -r requirements.txt

# use 'ec' to install the IOC in the local docker instance
source ./environment.sh
ec deploy bl01t-di-cam-01 0.1.0

ec ps

