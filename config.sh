#!/bin/bash

# activate the venv
. ./venv/bin/activate

# setup ec to talk to our local podman/docker
. ./environment.sh

echo "you can now use 'ec' commands to interaact with your local IOCs"
echo "or ./phoebus.sh to launch a GUI"

