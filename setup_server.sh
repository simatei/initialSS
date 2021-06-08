echo "INSTALL DOCKER ENGINE"
sleep 2
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
echo docker version
echo "INSTALL DOCKER COMPOSE"
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
echo docker-compose version
sleep 2
echo "GENERATING SSH KEYS"
ssh-keygen
echo "SSH KEY GENERATED SUCCESSFULLY"
sleep 2
echo "SETUP GIT"
echo "ENTER GIT NAME"
read NAME
git config --global user.name $NAME

echo "ENTER GIT E-MAIL"
read EMAIL
git config --global user.email $EMAIL
sleep 2
echo "SETUP SUCCESSFUL"
