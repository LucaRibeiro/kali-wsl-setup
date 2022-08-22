## Discord ##
printf "\n${RED}Installing discord${YELLOW}\n"
curl "https://discord.com/api/download?platform=linux&format=deb" -L --output $HOME/Downloads/discord.deb
sudo dpkg -i $HOME/Downloads/discord.deb
rm $HOME/Downloads/discord.deb

## Spotify ##
pritn "\n${RED}Installing Spotify${YELLOW}\n"
sudo snap install spotify
