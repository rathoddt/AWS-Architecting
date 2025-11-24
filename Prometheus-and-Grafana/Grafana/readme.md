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

## Database Monitoring with Grafana: MySQL
```
sudo apt update
sudo apt install mysql-server
sudo sytemctl status mysql 
sudo systemctl status mysql 

sudo mysql
mysql --version
nano setup_mysql_grafana.sh

sudo mysql < setup_mysql_grafana.sh 

sudo mysql

sudo cat /root/.mysql_history
sudo cat /root/.mysql_history | python3 -c "import sys; print(''.join([l.encode('utf-8').decode('unicode-escape') for l in sys.stdin]))"
```
MySQL Queries
```
show databases;
show events from grafana_monitoring;
show variables where variable_name='event_scheduler';
select host, user from mysql.user;
show events from grafana_monitoring;
use grafana_monitoring;
show tables;
select * from current;
select * from status;
```
