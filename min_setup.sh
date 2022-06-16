echo -e "\e[1;33mInstalling Docker Engine\e[0m"
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
docker version
sleep 1
echo -e "\e[1;34mInstalling Docker Compose\e[0m"
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
docker-compose version
