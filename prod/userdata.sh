#!/bin/bash
# 
# steps taken verbatim from:
#  http://docs.aws.amazon.com/AmazonECS/latest/developerguide/docker-basics.html#install_docker
#

#Install Java.
sudo apt update
sudo apt install openjdk-8-jdk -y

#Add the Jenkins Debian repository.
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -

sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

#Install Jenkins
sudo apt update

sudo apt install jenkins -y

sudo ufw allow 8080

sudo service jenkins start

#Installing Terraform

sudo apt install unzip

wget -q https://releases.hashicorp.com/terraform/0.11.11/terraform_0.11.11_linux_amd64.zip

sudo unzip -o terraform_0.11.11_linux_amd64.zip -d /usr/local/bin
rm terraform_0.11.11_linux_amd64.zip

# install pip
wget -q https://bootstrap.pypa.io/get-pip.py
sudo python3 get-pip.py
rm -f get-pip.py
# install awscli
sudo pip install awscli

