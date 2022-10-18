#!/bin/bash

echo -e "\e[1;33mInstalling Docker Engine\e[0m"
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
docker version
sleep 1
echo -e "\e[1;34mInstalling Docker Compose\e[0m"
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
docker-compose version
sleep 1
echo -e "\e[1;33mGenerating SSH Keys\e[0m"
ssh-keygen
echo -e "\e[1;32mSSH Keys generated successfully! \e[0m"
sleep 1
echo -e "\e[1;34mSetting up GIT config\e[0m"
sleep 1
echo -e "\e[1;33mEnter your git name: \e[0m"
read NAME
git config --global user.name "$NAME"
echo -e "\e[1;33mEnter your git email: \e[0m"
read EMAIL
git config --global user.email $EMAIL
echo -e "\e[1;32mGIT config set successfully! \e[0m"
sleep 1
echo -e "\e[1;33mYour git settings are: \e[0m"
git config --list
echo -e "\e[1;32mYour SSH keys are: \e[0m"
cat ~/.ssh/id_rsa.pub
sleep 1
echo -e "\e[1;32mInitial Server Setup is Complete! \e[0m"
