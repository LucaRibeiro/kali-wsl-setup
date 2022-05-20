#!/bin/bash

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
printf "\n${GREEN}Installing languages:${NC}\n"
printf "\n- python (pyenv, pipx and pipenv) ${YELLOW}\n"
printf "\n- gcc ${YELLOW}\n"
printf "\n- Golang ${YELLOW}\n"
printf "\n- ruby ${YELLOW}\n"
printf "\n- NodeJs (npm, yarn) ${YELLOW}\n"
### GCC ###
sudo apt install gcc -y
### Python ###
sudo apt install python3 -y
curl https://pyenv.run | bash
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init -)"' >> ~/.zshrc
source ~/.zshrc
pip install --user pipx
pipx install --user pipenv
### Ruby ###
sudo apt install ruby gem
### NodeJs ###
sudo apt install nodejs npm -y
sudo npm install typescript yarn -g
### Golang ###
$endpoint_download=(curl https://go.dev/dl/ | grep '<a class="download downloadBox"' | grep linux-amd64 | cut -d '"' -f4)
curl https://go.dev/$endpoint_download --output $HOME/Downloads/golang.tar.gz
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf $HOME/Downloads/golang.tar.gz
rm $HOME/Downloads/golang.tar.gz
echo '''
export GOPATH=$HOME/go
export GOROOT=/usr/local/go
PATH=$GOPATH/bin:$GOROOT/bin:$PATH
''' >> $HOME/.zshrc


##############################
####### Virtualization #######
##############################
printf "\n${GREEN}"
printf "Installing virtualization tools:"
printf "\t - Docker"
printf "\t - Virtual Box"
printf "\t - Genymotion"
printf "${NC}"
### Docker ###
sudo apt-get install ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo groupadd docker
sudo usermod -aG docker $USER
sudo systemctl enable docker.service
sudo systemctl enable containerd.service
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
printf "\t - Installing nvim"
printf "\t - Visual Studio Code"
printf "\t - Android studio"
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