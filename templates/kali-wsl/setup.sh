#!/bin/bash

RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'
BLINK = '\e[5mBlink'

if grep -q 'Dpkg::Progress-Fancy "1";' /etc/apt/apt.conf.d/99progressbar; then
    echo 'Dpkg::Progress-Fancy "1";' |
        sudo tee /etc/apt/apt.conf.d/99progressbar
fi

if grep -q 'Dpkg::Progress-Fancy::' /etc/apt/apt.conf.d/99progressbar; then
    echo 'Dpkg::Progress-Fancy::Progress-Bg "%1b[40m";' |
        sudo tee /etc/apt/apt.conf.d/99progressbar
fi

#### Basics ####

printf "\n${RED}Install cURL${YELLOW}\n"
apt install curl -y -qq

printf "\n${RED}Install Vim${YELLOW}\n"
apt install vim -y -qq

printf "\n${RED}Install and configure Git${YELLOW}\n"
apt install git -y -qq
printf "${RED}${BLINK}Git Name: ${YELLOW}"
read GIT_NAME
git config --global user.name $GIT_NAME
printf "\n${RED}${BLINK}Git Mail: ${YELLOW}"
read GIT_EMAIL
git config --global user.email $GIT_EMAIL
git config --global core.editor vim

printf "\n${RED}Install latest version from python and pip${YELLOW}\n"
apt install python3 -y -qq
apt install python3-pip -y -qq

printf "\n${RED}Install golang${YELLOW}\n"
apt install golang -y -qq
GOROOT=$HOME/go
PATH=$PATH:$GOROOT/bin
echo '''
export GOROOT=$HOME/go
export PATH=$PATH:$GOROOT/bin
''' >> ~/.bashrc

#### ZSH Shell ####

printf "\n${RED}Install zsh${YELLOW}\n"
sudo apt install zsh -y -qq

printf "\n${RED}Install oh-my-zsh${YELLOW}\n"
if [[ -f /root/.oh-my-zsh ]]; then
    rm -rf /root/.oh-my-zsh
fi
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

printf "\n${RED}Update and upgrade${YELLOW}\n"
apt update -qq && apt upgrade -y -qq

#### Pentest Tools ####

printf "\n${RED}Install nmap${YELLOW}\n"
apt install nmap -y -qq

printf "\n${RED}Install hydra${YELLOW}\n"
apt install hydra -y -qq

printf "\n${RED}Install metasploit framework${YELLOW}\n"
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb >msfinstall
chmod 755 msfinstall
./msfinstall
rm -f ./msfinstall
