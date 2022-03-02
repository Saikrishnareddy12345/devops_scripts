#!/bin/bash
yum update -y
yum install wget -y
useradd -m -s /bin/bash prometheus
su - prometheus
wget https://github.com/prometheus/prometheus/releases/download/v2.19.2/prometheus-2.19.2.linux-amd64.tar.gz
tar -xvf prometheus-2.19.2.linux-amd64.tar.gz
mv prometheus-2.19.2.linux-amd64/ prometheus/
mkdir -p ~/prometheus/data
vi /etc/systemd/system/prometheus.service
cat << 'EOF' > /etc/syatemd/system/prometheus.service
[Service]
User=prometheus
Restart=on-failure

#Change this line if you download the
#Prometheus on different path user
ExecStart=/home/prometheus/prometheus/prometheus \
  --config.file=/home/prometheus/prometheus/prometheus.yml \
  --storage.tsdb.path=/home/prometheus/prometheus/data

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl enable prometheus
sudo systemctl start prometheus
systemctl status prometheus