#!/bin/bash

OS="Linux Mint 18.1"
GIT_NAME="YOUR NAME"
GIT_EMAIL="YOUR EMAIL"
ITEM=""

source setup_common.sh
source setup_xenial.sh

echo "Following items will be installed..."
echo "${ITEM}"

sudo apt-get update
sudo apt-get -f install
sudo apt-get install ${ITEM}
sudo apt-get autoclean
sudo apt-get autoremove

echo " End of setup..."
