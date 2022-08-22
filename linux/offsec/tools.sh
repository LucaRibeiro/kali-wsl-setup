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
printf "\n\t- Amass"
printf "\n\t- assetfinder"
printf "\n\t- subfinder"
printf "\n\t- findomain"
printf "\n\t- dnsgen"
printf "\n\t- findomain"
printf "\n\t- massdns"
printf "\n\t- shuffledns"

printf "${NC}\n"

### Amass ###
go install -v github.com/OWASP/Amass/v3/...@master
### Assetfinder ###
go install -v github.com/tomnomnom/assetfinder@latest
### subfinder ###
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
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
printf "\n\t- Feroxbuster"
printf "\n\t- fuff"
printf "\n\t- sqlmap (to-do)"
printf "${NC}\n"

### Feroxbuster ###
curl -sL https://raw.githubusercontent.com/epi052/feroxbuster/master/install-nix.sh | bash
### fuff ###
go install -v github.com/ffuf/ffuf@latest
### httpx ###
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
# # sqlmap #
path=$(pwd)
cd $HOME/tools/scan
curl https://github.com/sqlmapproject/sqlmap/zipball/master -L --output slqmap.zip
unzip slqmap.zip
mv sqlmap* sqlmap
cd sqlmap
mv sqlmap.py bkp_sqlmap.py
echo '#!/usr/bin/env python3' > sqlmap.py
tail -n +2 bkp_sqlmap.py >> sqlmap.py
chmod +x sqlmap.py
rm bkp_sqlmap.py
sudo ln -s /usr/local/bin/slqmap $PWD/sqlmap.py
cd $path


############################
########## Mobile ##########
############################
printf "${GREEN}"
printf "\nInstalling Mobile tools:"
printf "\n\t- Frida Tools"
printf "\n\t- Apktool"
printf "\n\t- Bytecode Viewer"
printf "\n\t- scrcpy"
printf "\n\t- apksigner"
printf "\n\t- pidcat"
printf "${NC}\n"

# frida #
pipx install frida-tools

# scrcpy #
sudo apt install scrcpy apksigner apktool -y

# Pidcat & make it executable
sudo wget -O /usr/local/bin/pidcat https://raw.githubusercontent.com/JakeWharton/pidcat/master/pidcat.py && \
	sudo chmod +x /usr/local/bin/pidcat

###################################
############## Utils ##############
###################################
# Anew #
go install -v github.com/tomnomnom/anew@latest
# SecLists #
wget -c https://github.com/danielmiessler/SecLists/archive/master.zip -O SecList.zip
unzip SecList.zip -d $HOME/tools/utils
rm -f SecList.zip
### Nmap ###
printf "\n${GREEN}Installing Nmap${NC}\n"
sudo apt install nmap -y
