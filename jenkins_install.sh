#!/bin/bash
yum update -y
sudo wget -O /etc/yum.repos.d/jenkins.repo     https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
yum repolist
amazon-linux-extras install java-openjdk11 -y
amazon-linux-extras install epel -y
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
yum install jenkins -y
systemctl enable jenkins
systemctl start jenkins

