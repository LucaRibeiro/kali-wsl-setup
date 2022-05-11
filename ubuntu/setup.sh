#!/bin/bash

#### Colors ####
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'
GREEN='\033[0;32m'
BLINK='\e[5m'

### Update packages ##
sudo apt update

#### Basics ####
printf "\n${RED}Install curl${YELLOW}\n"
sudo apt install curl 


printf "\n${RED}Installing wget ${YELLOW}\n"
sudo apt install wget -y


printf "\n${RED}Installing nvim${YELLOW}\n"
sudo apt install nvim -y


printf "\n${RED}Installing curl${YELLOW}\n"
sudo apt install curl -y


printf "\n${RED}Installing python3${YELLOW}\n"
sudo apt install python3-pip python3 -y


printf "\n${RED}Installing git${YELLOW}\n"
sudo apt install git -y


printf "${GREEN}${BLINK}Git Name: ${NC}"
read GIT_NAME
git config --global user.name $GIT_NAME
printf "\n${GREEN}${BLINK}Git Mail: ${NC}"
read GIT_EMAIL
git config --global user.email $GIT_EMAIL
git config --global core.editor nvim


printf "\n${RED}Installing golang${YELLOW}\n"
wget https://go.dev/dl/go1.18.1.linux-amd64.tar.gz
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf go1.18.1.linux-amd64.tar.gz
rm go1.18.1.linux-amd64.tar.gz


echo '''
export GOPATH=$HOME/go
export GOROOT=/usr/local/go
PATH=$GOPATH/bin:$GOROOT/bin:$PATH
''' >> $HOME/.bashrc

source ~/.bashrc


printf "\n${RED}Installing Vistual Studio Code${YELLOW}\n"
sudo snap install code --classic


printf "\n${RED}Installing PowerShell${YELLOW}\n"
sudo snap install powershell --classic


printf "\n${RED}Installing brave${YELLOW}\n"
sudo snap install brave


printf "\n${RED}Installing android studio${YELLOW}\n"
sudo snap install android-studio --classic
