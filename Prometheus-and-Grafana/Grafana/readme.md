## Grafana

```
python3 push-to-gateway.py 
sudo apt update
sudo apt install -y adduser libfontconfig1 musl
#https://grafana.com/grafana/download
wget https://dl.grafana.com/grafana-enterprise/release/12.3.0/grafana-enterprise_12.3.0_19497075765_linux_amd64.deb
sudo dpkg -i grafana-enterprise_12.3.0_19497075765_linux_amd64.deb
sudo /bin/systemctl daemon-reload
sudo /bin/systemctl enable grafana-server
sudo systemctl status grafana-server
```
