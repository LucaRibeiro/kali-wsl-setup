#!/bin/bash

### Colors ###
RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
NC='\033[0m'

############################
########## Basics ##########
############################
### Git ###
printf "\n${GREEN}Installing git${NC}\n"
sudo apt install git -y
printf "${GREEN}Git Name: ${NC}"
read GIT_NAME
git config --global user.name $GIT_NAME
printf "\n${GREEN}Git Mail: ${NC}"
read GIT_EMAIL
git config --global user.email $GIT_EMAIL
git config --global core.editor neovim


#############################
######### Languages #########
#############################
printf "${GREEN}"
printf "\nInstalling languages:"
printf "\n\t- python (pyenv, pipx and pipenv)"
printf "\n\t- gcc"
printf "\n\t- Golang"
printf "\n\t- ruby"
printf "\n\t- NodeJs (npm, yarn)"
printf "\n\t- .Net"
printf "${NC}"

### GCC ###
sudo apt install gcc -y
### Python ###
sudo apt install python3 -y
curl https://pyenv.run | bash
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init -)"' >> ~/.zshrc
pip install --user pipx
pipx install --user pipenv
### Ruby ###
sudo apt install ruby gem
### NodeJs ###
sudo apt install nodejs npm -y
sudo npm install typescript yarn -g
## Golang ###
endpoint_download=$(curl https://go.dev/dl/ | grep '<a class="download downloadBox"' | grep linux-amd64 | cut -d '"' -f4)
curl https://go.dev/$endpoint_download -L --output $HOME/Downloads/golang.tar.gz
sudo tar -C /usr/local -xzf $HOME/Downloads/golang.tar.gz
rm $HOME/Downloads/golang.tar.gz
echo '''
export GOPATH=$HOME/go
export GOROOT=/usr/local/go
PATH=$GOPATH/bin:$GOROOT/bin:$PATH
''' >> $HOME/.zshrc
### .Net ###
sudo snap install dotnet-sdk --classic --channel=6.0
sudo snap alias dotnet-sdk.dotnet dotnet

##############################
####### Virtualization #######
##############################
printf "${GREEN}"
printf "Installing virtualization tools:"
printf "\n\t - Docker"
printf "\n\t - Virtual Box"
printf "\n\t - Genymotion"
printf "${NC}"
### Docker ###
curl -fsSL https://get.docker.com -o $HOME/Downloads/get-docker.sh
sudo sh $HOME/Downloads/get-docker.sh
### Virtual Box ###
sudo apt install virtualbox -y
### Genymotion ###
url_download_genymotion=$(curl https://www.genymotion.com/download/ | egrep "href.*linux" | cut -d '"' -f 2)
curl $url_download_genymotion --output $HOME/Downloads/genymotion_install.bin
chmod +x $HOME/Downloads/genymotion_install.bin
sudo $HOME/Downloads/genymotion_install.bin


###############################
####### IDE/Code Editor #######
###############################
printf "\n${GREEN}"
printf "Installing IDEs and Code Editors:"
printf "\n\t - Installing nvim"
printf "\n\t - Visual Studio Code"
printf "\n\t - Android studio"
printf "${NC}"
### NeoVim ###
sudo apt install neovim -y
### Visual Studio Code ###
sudo snap install code --classic
### Android Studio ###
sudo snap install android-studio --classic
### Intellij Idea Community ##
sudo snap install intellij-idea-community --classic


#######################
######## Utils ########
#######################
printf "\n${GREEN}Installing Postman${NC}\n"
### Postman ###
sudo snap install postman