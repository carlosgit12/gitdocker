#!/bin/bash
# Exercise 1
#1. Install Docker Engine using the official Docker APT repository.
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install docker-ce
#2. Enable and start the Docker service.
sudo service docker start
#3. Print the info of the Docker Client and Server.
docker info

# Exercise 2
#1. Search for the official repos of Ubuntu, Alpine, Nginx.
docker search ubuntu --filter is-official=true
docker search alpine --filter is-official=true
docker search nginx --filter is-official=true
#2. Run an Nginx container using the image from the official repo.
docker create nginx
docker ps -a
docker start inspiring_cannon

#Excercise 3
#1. Check docker daemon status
systemctl status docker
#2. Stop the Docker daemon 
sudo systemctl stop docker.socket
#3. Run a container while it’s stopped. 
docker run hello-world
#4. Restart the Docker daemon and run a container again.

