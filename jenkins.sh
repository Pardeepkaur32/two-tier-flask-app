#!/bin/bash

echo "Updating system..."
sudo apt update

echo "Installing Java..."
sudo apt install openjdk-17-jdk -y

echo "Adding Jenkins repository..."
curl -fsSL https://pkg.jenkins.io/debian/jenkins.io-2023.key | sudo tee \
/usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo "Adding Jenkins source list..."
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
https://pkg.jenkins.io/debian binary/ | sudo tee \
/etc/apt/sources.list.d/jenkins.list > /dev/null

echo "Updating again..."
sudo apt update

echo "Installing Jenkins..."
sudo apt install jenkins -y

echo "Starting Jenkins..."
sudo systemctl start jenkins
sudo systemctl enable jenkins

echo "Jenkins installed successfully!"
echo "Open: http://localhost:8080"

echo "Initial password:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
