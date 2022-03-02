#!/bin/bash
yum update -y
amazon-linux-extras install java-openjdk11
cd /opt; wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-8.9.7.52159.zip
unzip sonarqube-8.9.7.52159.zip
mv sonarqube-8.9.7.52159 sonarqube
adduser sonaradmin
chown -R sonaradmin:sonaradmin sonarqube
chmod -R 777 /opt/sonarqube/
su - sonaradmin
cd /sonarqube/bin/linux-x86-64/; ./sonar.sh start
./sonar.sh status