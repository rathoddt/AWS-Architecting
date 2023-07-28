# Setting up Wordpress site with EC2 & RDS

```
# Chaning default directory to /var/www/wordpress
sudo mv 000-default.conf /etc/apache2/sites-enabled/
```

`000-default.conf` content

```
<VirtualHost *:80>
    ServerAdmin admin@test.com
    DocumentRoot /var/www/wordpress
    ServerName wordpress.test

    <Directory /var/www/wordpress>
         Options FollowSymlinks
         AllowOverride All
         Require all granted
    </Directory>

ErrorLog ${APACHE_LOG_DIR}/error.log
CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
```