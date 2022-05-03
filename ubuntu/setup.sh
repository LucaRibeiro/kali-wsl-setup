#!/bin/bash

RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'
BLINK = '\e[5mBlink'

#### Basics ####

printf "\n${RED}Install basics (curl, wget, nvim, git, python3, pip3, prips, unzip)${YELLOW}\n"
sudo apt install curl wget nvim git python3-pip python3 prips -y

printf "${RED}${BLINK}Git Name: ${YELLOW}"
read GIT_NAME
git config --global user.name $GIT_NAME
printf "\n${RED}${BLINK}Git Mail: ${YELLOW}"
read GIT_EMAIL
git config --global user.email $GIT_EMAIL
git config --global core.editor nvim


#### Pentest Tools ####

printf "\n${RED}Install nmap${YELLOW}\n"
sudo apt install nmap -y 

#### Golang Tools ####

printf "\n${RED}Install golang${YELLOW}\n"
wget https://go.dev/dl/go1.18.1.linux-amd64.tar.gz
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf go1.18.1.linux-amd64.tar.gz
rm go1.18.1.linux-amd64.tar.gz

GOHOME=$HOME/go
GOROOT=/usr/local/go
export PATH=$GOROOT/bin:$PATH
export PATH=$GOHOME/bin:$PATH

echo '''
export GOHOME=$HOME/go
export GOROOT=/usr/local/go
PATH=$PATH
''' >> $HOME/.bashrc

### Golang tools ###

go install github.com/tomnomnom/anew@latest
go install github.com/OWASP/Amass/v3/...@master
go install github.com/tomnomnom/assetfinder@latest
go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install github.com/Josue87/gotator@latest
go install github.com/ffuf/ffuf@latest

### Setup tools folder ###
mkdir $HOME/tools
mkdir $HOME/tools/bin
mkdir $HOME/tools/utils
mkdir $HOME/tools/recon
mkdir $HOME/tools/scan
mkdir $HOME/tools/

export PATH=$HOME/tools/bin:$PATH

wget https://github.com/findomain/findomain/releases/latest/download/findomain-linux -o findomain
chmod +x findomain
mv $HOME/tools/bin/findomain

### SecLists ###
wget -c https://github.com/danielmiessler/SecLists/archive/master.zip -O SecList.zip
unzip SecList.zip -d $HOME/tools/utils
rm -f SecList.zip