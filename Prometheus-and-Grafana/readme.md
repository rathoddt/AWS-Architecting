## Prometheus and Grafana
### Setting up Promethrus server - Ubuntu
```
sudo apt-get update
pwd
whoami
wget https://github.com/prometheus/prometheus/releases/download/v3.7.2/prometheus-3.7.2.linux-amd64.tar.gz
sudo group add --system prometheus
sudo groupadd --system prometheus
sudo useradd -s /sbin/nologin --system -g prometheus prometheus
sudo mkdir /var/lib/prometheus
sudo mkdir -p /etc/prometheus/rules
sudo mkdir -p /etc/prometheus/rules.s
sudo mkdir -p /etc/prometheus/files_sd
tar -xvzf prometheus-3.7.2.linux-amd64.tar.gz 
ls
cd prometheus-3.7.2.linux-amd64/
ls
sudo mv prometheus promtool /usr/local/bin/
prometheus --version
sudo mv prometheus.yml /etc/prometheus/
ls /etc/prometheus/
sudo tee /etc/systemd/system/prometheus.service<<EOF
[Unit]
Description=Prometheus
Documentation=https://prometheus.io/docs/introduction/overview/
Wants=network-online.target
After=network-online.target
[Service]
Type=simple
User=prometheus
Group=prometheus
ExecReload=/bin/kill -HUP $MAINPID
ExecStart=/usr/local/bin/prometheus   --config.file=/etc/prometheus/prometheus.yml   --storage.tsdb.path=/var/lib/prometheus   --web.console.templates=/etc/prometheus/consoles   --web.console.libraries=/etc/prometheus/console_libraries   --web.listen-address=0.0.0.0:9090   --web.external-url=
SyslogIdentifier=prometheus
Restart=always
[Install]
WantedBy=multi-user.target
EOF
sudo chown -R prometheus:prometheus /etc/prometheus
sudo chown -R prometheus:prometheus /etc/prometheus/*
sudo chmod 775 /etc/prometheus
sudo chmod -R 775 /etc/prometheus/*
sudo chmod -R 775 /etc/prometheus
sudo chown -R /var/lib/prometheus
sudo chown -R prometheus:prometheus /var/lib/prometheus
sudo chown -R prometheus:prometheus /var/lib/prometheus/*
sudo systemctl damon-reload
sudo systemctl daemon-reload
sudo systemctl start prometheus
sudo systemctl enable prometheus
systemctl status prometheus
history
history -w /dev/stdout
```
