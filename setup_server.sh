tput setaf 4; echo "INSTALL DOCKER ENGINE"
sleep 2
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
docker version
sleep 2
tput setaf 4; echo "INSTALL DOCKER COMPOSE"
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
docker-compose version
sleep 2
tput setaf 4; echo "GENERATING SSH KEYS"
ssh-keygen
tput setaf 4;echo "SSH KEY GENERATED SUCCESSFULLY"
sleep 2
tput setaf 4; echo "SETUP GIT"
sleep 1
tput setaf 4; echo "ENTER GIT NAME"
read NAME
tput setaf 4; echo $NAME
git config --global user.name "$NAME"
sleep 1
tput setaf 4; echo "ENTER GIT E-MAIL"
read EMAIL
git config --global user.email $EMAIL
sleep 2
tput setaf 4; echo "YOUR GIT SETTINGS"
git config --global user.name
git config --global user.email
sleep 2
tput setaf 10; echo "SETUP SUCCESSFUL"
