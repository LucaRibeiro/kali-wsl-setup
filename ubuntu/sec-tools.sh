#!/bin/bash

GREEN='\033[0;32m'
NC='\033[0m'

##########################
###### Setup folder ######
##########################
mkdir $HOME/tools
mkdir $HOME/tools/bin
mkdir $HOME/tools/utils
mkdir $HOME/tools/recon
mkdir $HOME/tools/scan
mkdir $HOME/tools/mobile
mkdir $HOME/tools

export PATH=$HOME/tools/bin:$PATH

###########################
######## Subdomain ########
###########################
printf "${GREEN}"
printf "\nInstalling Subdomain Enumeration Tools:"
printf "\t- Amass"
printf "\t- assetfinder"
printf "\t- subfinder"
printf "\t- findomain"
printf "\t- dnsgen"
printf "\t- findomain"
printf "\t- massdns"
printf "\t- shuffledns"

printf "${NC}"

### Amass ###
go install github.com/OWASP/Amass/v3/...@master
### Assetfinder ###
go install github.com/tomnomnom/assetfinder@latest
### subfinder ###
go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
### Findomain ###
wget https://github.com/findomain/findomain/releases/latest/download/findomain-linux
chmod +x findomain-linux
mv findomain-linux $HOME/tools/bin/findomain
sudo strip -s /usr/local/bin/findomain
### dnsgen ###
pipx install dnsgen
### MassDns ###
path=$(pwd)
cd $HOME/Downloads
git clone https://github.com/blechschmidt/massdns
cd massdns
make
sudo mv bin/massdns /usr/local/bin/
cd $path
### shuffledns ###
go install -v github.com/projectdiscovery/shuffledns/cmd/shuffledns@latest


#########################
########## Web ##########
#########################
printf "\n${GREEN}"
printf "\nInstalling Web tools:"
printf "\t- Feroxbuster"
printf "\t- fuff"
printf "\t- sqlmap (to-do)"
printf "${NC}"

# Feroxbuster #
sudo snap install feroxbuster
# fuff #
go install github.com/ffuf/ffuf@latest
# # sqlmap #
# path=$(pwd)
# cd $HOME/tools/scan
# curl https://github.com/sqlmapproject/sqlmap/zipball/master -L --output slqmap.zip
# unzip slqmap.zip
# mv sqlmap* sqlmap
# cd sqlmap
# mv sqlmap.py bkp_sqlmap.py
# echo '#!/usr/bin/env python3' > sqlmap.py
# tail -n +2 bkp_sqlmap.py >> sqlmap.py
# chmod +x sqlmap.py
# rm bkp_sqlmap.py
# sudo ln -s /usr/local/bin/slqmap $PWD/sqlmap.py
# cd $path


############################
########## Mobile ##########
############################
printf "${GREEN}"
printf "\nInstalling Mobile tools:"
printf "\t- Frida Tools"
printf "\t- Apktool"
printf "\t- Bytecode Viewer"
printf "\t- scrcpy"
printf "${NC}"

# frida #
pip3 install frida-tools
# apktool #

# ByteCode Viewer #
latest_bv=$(curl https://github.com/Konloch/bytecode-viewer/releases/latest -si | grep 'location:' | rev | cut -d '/' -f 1 | rev | sed 's/v//')
curl https://github.com/Konloch/bytecode-viewer/releases/download/v$latest_bv/Bytecode-Viewer-$latest_bv.jar --output $HOME/Bytecode-Viewer.jar
mv Bytecode-Viewer.jar $HOME/tools/mobile/Bytecode-Viewer.jar
# scrcpy #
sudo apt install scrcpy -y

###################################
############## Utils ##############
###################################
# Anew #
go install github.com/tomnomnom/anew@latest
# SecLists #
wget -c https://github.com/danielmiessler/SecLists/archive/master.zip -O SecList.zip
unzip SecList.zip -d $HOME/tools/utils
rm -f SecList.zip
### Nmap ###
printf "\n${GREEN}Installing Nmap${NC}\n"
sudo apt install nmap -y
