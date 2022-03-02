#!/bin/bash
#port=8081
yum update -y
cd /opt; wget  https://download.sonatype.com/nexus/3/nexus-3.37.3-02-unix.tar.gz
tar -xvzf nexus-3.37.3-02-unix.tar.gz
mv nexus-3.37.3-02-unix nexus
useradd nexus
echo "nexus ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/90-cloud-init-users
chown -R nexus:nexus nexus
chown -R nexus:nexus sonatype-work
sudo yum install java-1.8.0-openjdk-devel -y
cat << 'EOF' > /etc/systemd/system/nexus.service
# insert the follwing content amd save it
[Unit]
Description=nexus service
After=network.target
  
[Service]
Type=forking
LimitNOFILE=65536
ExecStart=/opt/nexus/bin/nexus start
ExecStop=/opt/nexus/bin/nexus stop
User=nexus
Restart=on-abort
TimeoutSec=600
  
[Install]
WantedBy=multi-user.target
EOF
systemctl enable nexus
systemctl start nexus
