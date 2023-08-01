# Amazon Virtual Private Cloud

https://cidr.xyz/

## Subnets
https://docs.aws.amazon.com/vpc/latest/userguide/subnet-sizing.html

    `10.0.0.0`: Network address.  

    `10.0.0.1` : Reserved by AWS for the VPC router.  

    `10.0.0.2`: Reserved by AWS. The IP address of the DNS server is the base of the VPC network range plus two. For VPCs with multiple CIDR blocks, the IP address of the DNS server is located in the primary CIDR. We also reserve the base of each subnet range plus two for all CIDR blocks in the VPC. For more information, see Amazon DNS server.  

    `10.0.0.3`: Reserved by AWS for future use.  

    `10.0.0.255`: Network broadcast address. AWS do not support broadcast in a VPC, therefore we reserve this address.  

 ## VPC Peering
 - Create VPC peering
 - Accept the peering request
 - Add route table entry in both VPC's RT with CIDR range & target as VPC Perring connection name

Bootstrap script to install Apache & WordPress
```
#!/bin/bash
sudo apt update -y
sudo apt install php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip perl mysql-server apache2 libapache2-mod-php php-mysql -y
wget https://github.com/ACloudGuru-Resources/course-aws-certified-solutions-architect-associate/raw/main/lab/5/wordpress.tar.gz
tar zxvf wordpress.tar.gz
cd wordpress
wget https://raw.githubusercontent.com/ACloudGuru-Resources/course-aws-certified-solutions-architect-associate/main/lab/5/000-default.conf
cp wp-config-sample.php wp-config.php
perl -pi -e "s/database_name_here/wordpress/g" wp-config.php
perl -pi -e "s/username_here/wordpress/g" wp-config.php
perl -pi -e "s/password_here/wordpress/g" wp-config.php
perl -i -pe'
  BEGIN {
    @chars = ("a" .. "z", "A" .. "Z", 0 .. 9);
    push @chars, split //, "!@#$%^&*()-_ []{}<>~\`+=,.;:/?|";
    sub salt { join "", map $chars[ rand @chars ], 1 .. 64 }
  }
  s/put your unique phrase here/salt()/ge
' wp-config.php
mkdir wp-content/uploads
chmod 775 wp-content/uploads
mv 000-default.conf /etc/apache2/sites-enabled/
mv /wordpress /var/www/
apache2ctl restart
```
