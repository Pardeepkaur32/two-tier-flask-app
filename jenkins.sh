#!/bin/bash

echo "Installing Java..."
sudo apt update
sudo apt install fontconfig openjdk-17-jre -y
java -version

echo "Installing Jenkins..."

sudo mkdir -p /etc/apt/keyrings

sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc 
https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | 
sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt update

sudo apt install jenkins -y

echo "Jenkins installed successfully"

