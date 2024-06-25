#!/bin/bash

THIS_DIR=$(cd $(dirname $0); pwd)

sudo mkdir -p /output
sudo rm -rf /output/*

# setup a python virtual environment with the required packages
cd $THIS_DIR
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt

# use 'ec' to install the IOC in the local docker instance
source ./environment.sh
ec deploy bl01t-di-cam-01 0.1.0
