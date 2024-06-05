#!/bin/bash
# Sets up rabbit mq with docker
# Update package list
sudo apt update

# Install Docker
sudo apt install -y docker.io

# Pull the RabbitMQ Docker image
sudo docker pull rabbitmq

# Create a Docker network (optional)
sudo docker network create rabbitmq-network

# Run the RabbitMQ container
sudo docker run -d --name rabbitmq -p 5672:5672 -p 15672:15672 --network rabbitmq-network rabbitmq

# Print the RabbitMQ management UI URL
echo "RabbitMQ management UI: http://$(curl -s https://ipinfo.io/ip):15672"
echo "Default username: guest"
echo "Default password: guest"
