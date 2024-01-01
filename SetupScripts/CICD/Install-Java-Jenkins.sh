#!/bin/bash

echo
echo "Installing Jenkins For CICD..."
sudo apt update
sudo apt install fontconfig openjdk-17-jre
java -version

#jenkins
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
/etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins
sudo systemctl start jenkins
sudo systemctl enable jenkins

echo 
echo "Jenkins is Installed"
echo 
echo "Adding Jenkins in Docker Group"
sudo usermod -a -G docker jenkins
sudo systemctl restart jenkins
echo
Password=$(sudo cat /var/lib/jenkins/secrets/initialAdminPassword)
echo "Admin Password : $Password"