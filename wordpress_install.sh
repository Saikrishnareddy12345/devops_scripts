#!/bin/bash
yum update -y
yum install httpd -y
yum install php-mysql -y
amazon-linux-extras install php7.3 -y
cd /var/www/html/;wget http://wordpress.org/latest.tar.gz
tar -zxvf latest.tar.gz
rm -rf latest.tar.gz
systemctl enable httpd
systemctl start httpd
