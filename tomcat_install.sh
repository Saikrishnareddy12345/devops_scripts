#!/bin/bash
yum update -y
amazon-linux-extras install java-openjdk11 -y
cd /opt/;wget https://dlcdn.apache.org/tomcat/tomcat-10/v10.0.16/bin/apache-tomcat-10.0.16.tar.gz
tar -xvzf apache-tomcat-10.0.16.tar.gz
mv apache-tomcat-10.0.16.tar.gz tomcat
sh tomcat/bin/startup.sh
echo "this is from developer2"
=======

echo "tomcat developer1"

