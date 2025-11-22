## Prometheus and Grafana
### Setting up Promethrus server - Ubuntu
```
sudo apt-get update
pwd
whoami
wget https://github.com/prometheus/prometheus/releases/download/v3.7.2/prometheus-3.7.2.linux-amd64.tar.gz
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

```

Creating service for Prometheus

```
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
```

```
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
```
## Setting up Node Exporter - Ubuntu
```
sudo apt get update
sudo apt update
sudo apt get upgrade
sudo apt upgrade
wget https://github.com/prometheus/node_exporter/releases/download/v1.10.2/node_exporter-1.10.2.linux-amd64.tar.gz
ls -lrth
tar -xvzf node_exporter-1.10.2.linux-amd64.tar.gz 
cd node_exporter-1.10.2.linux-amd64/
ls
./node_exporter 
ls
cd node_exporter-1.10.2.linux-amd64/
ls
```
Running node exporter
```
./node_exporter --web.listen-address=":9100" &
```
Running node expotter as a service
```
sudo groupadd --system prometheus
sudo useradd -s /sbin/nologin --system -g prometheus prometheus
sudo mkdir /var/lib/node
ls
cd node_exporter-1.10.2.linux-amd64/
ls
sudo mv node_exporter /var/lib/node/
ls /var/lib/node
sudo nano /etc/systemd/system/node.service
```
Service file
```
[Unit]
Description=Prometheus Node Exporter
Documentation=https://prometheus.io/docs/introduction/overview/
Wants=network-online.target
After=network-online.target

[Service]
Type=simple
User=prometheus
Group=prometheus
ExecReload=/bin/kill -HUP $MAINPID
ExecStart=/var/lib/node/node_exporter

SyslogIdentifier=prometheus_node_exporter
Restart=always

[Install]
WantedBy=multi-user.target
```

Assigning permission to `prometheus` user
```
sudo chown -R prometheus:prometheus /var/lib/node
sudo chown -R prometheus:prometheus /var/lib/node/*
sudo chmod /var/lib/node
sudo chmod 775 /var/lib/node
sudo chmod 775 /var/lib/node/*
sudo systemctl daemon-relaod
sudo systemctl daemon-reload
sudo systemctl start node.service 
sudo systemctl status node.service 
sudo systemctl enable node.service 
sudo systemctl status node.service
```

## Setting up Alert Manager - Ubuntu
```
ls /etc/prometheus/rules
sudo nano /etc/prometheus/rules/alerts.yaml
sudo nano /etc/prometheus/prometheus.yml 
sudo systemctl stop prometheus.service 
sudo systemctl daemon-reload
sudo systemctl start prometheus.service 
sudo systemctl status prometheus.service 
cat /etc/prometheus/rules/alerts.yaml
```
<b> https://samber.github.io/awesome-prometheus-alerts/rules.html</b>

## Setting up Push Gateway - Ubuntu

```
wget https://github.com/prometheus/pushgateway/releases/download/v1.11.2/pushgateway-1.11.2.linux-amd64.tar.gz
tar -xvzf pushgateway-1.11.2.linux-amd64.tar.gz 
./pushgateway-1.11.2.linux-amd64/pushgateway --help
cd pushgateway-1.11.2.linux-amd64/
sudo cp pushgateway /usr/local/bin/pushgateway
ls -lrth /usr/local/bin
sudo chown prometheus:prometheus /usr/local/bin
sudo chown prometheus:prometheus /usr/local/bin/*
ls -lrth /usr/local/bin

sudo nano /etc/systemd/system/pushgateway.service
sudo systemctl daemon-reload
sudo systemctl start pushgateway.service 
sudo systemctl status pushgateway.service 
sudo systemctl enable pushgateway.service 
sudo systemctl status pushgateway.service
```
