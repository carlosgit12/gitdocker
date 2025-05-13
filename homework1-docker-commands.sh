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
sudo systemctl restart docker.socket
docker run hello-world

#Exercise 4
#1. Run an Ubuntu container interactively.
docker run -it ubuntu
#2. Use apt update && apt install curl inside the container.
apt update && apt install curl
#3. Exit the container.
exit

#Exercise 5
#1. List running containers: 
 docker ps
#2. List all containers (including exited)
docker ps -a

#Exercise 6
#1. Run a container in the background 
docker run -d --name apache bitnami/apache:latest
#2. Then Pause it 
docker pause apache
#3. Unpause it: 
docker unpause apache
#4. Stop it 
docker stop apache
#5. Restart it 
docker restart apache
#6. Kill it
docker kill apache

#Exercise 7
#Remove a running container
docker ps
docker rm -f inspiring_cannon

#Exercise 8
#1. Pull the alpine and ubuntu images. 
docker pull alpine 
#2. List all the container images in your Docker Host.
docker ps -a

#Exercise 9
#1. Run alpine and execute echo "hello from alpine" 
docker run alpine echo "hello from alpine"
#2. Run busybox and execute uname -a 
docker run busybox uname -a
#3. List all the container
docker ps -a

#Exercise 10
#1. Remove all stopped containers. 
docker container prune
#2. Remove unused images. 
docker image prune -a
#3. Inspect Docker disk usage.
docker system df
