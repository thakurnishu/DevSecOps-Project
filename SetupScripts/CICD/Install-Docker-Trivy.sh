#!/bin/bash

echo "Installing Docker..."
sudo apt-get update
sudo apt-get install docker.io -y
sudo usermod -aG docker $USER  # Replace with your system's username, e.g., 'ubuntu'
newgrp docker
sudo chmod 777 /var/run/docker.sock
sleep 1
echo 
echo "Docker is Installed"

echo
echo "Running SonarQube in Docker Container"
docker run -d --name sonar -p 9000:9000 sonarqube:lts-community
echo 
echo "SonarQube container is running"

echo
echo "Installing Trivy..."
sudo apt-get install wget apt-transport-https gnupg lsb-release -y
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | sudo apt-key add -
echo deb https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main | sudo tee -a /etc/apt/sources.list.d/trivy.list
sudo apt-get update
sudo apt-get install trivy -y

echo
echo "Trivy is Installed"