#!/bin/bash

### Colors ###
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'
GREEN='\033[0;32m'
BLINK='\e[5m'

## Update packages ##
sudo apt update --fix--missing
sudo apt autoremove
sudo apt upgrade -y