#!/bin/bash

echo "updating system package"
sudo yum update -y

echo "installing java"
sudo yum install java-17-amazon-corretto-devel -y

echo "adding jenkins repo and key"
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

echo "Installing Jenkins"
yum install jenkins -y

echo "start jenkins"
sudo systemctl start jenkins

echo "enable jenkins"
sudo systemctl enable jenkins

echo "status jenkins"
sudo systemctl status jenkins


# Retriving of Jenkins Username and Password:
  --> Systemctl stop jenkins
  --> cd /var/lib/jenkins
  --> ls
  --> vi config.xml
  --> usesecurity --> [True to False]
  --> Systemctl restart jenkins

# Log in with Public IP with port 8080
--> Manage Jenkins--> Security--> Security realm for none to jenkins own user--> save
--> Go to User --> configure--> update password
--> Manage Jenkins--> Security--> Authorization--> logged in user




---
- name: Installation of maven
  hosts: web
  become: yes
  tasks:
   - name: download apache tar file
	   ansible.builtin.get_url:
	        url: https://archive.apache.org/dist/maven/maven-3/3.9.8/binaries/apache-maven-3.9.8-bin.tar.gz
          dest: /opt
          mode: '0755'