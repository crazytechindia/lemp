#!/bin/bash
#Author vijay sharma
#Mail: sharmavijay86@gmail.com
#Web: crazytechindia.com
apt-get update
apt-get install vim curl gcc htop sysstat unzip wget ufw fail2ban -y
apt-get install nginx -y
apt-get install php5-fpm php5-mysql php5-gd php5-mcrypt php5-curl php5 -y
apt-get install mysql-server -y
wget -O /tmp/phpmyadmin.zip http://repo.crazytechindia.com/src/phpmyadmin.zip
cd /tmp
unzip phpmyadmin.zip
mv phpMyAdmin-4.6.4-english /usr/share/phpmyadmin
ln -s /usr/share/phpmyadmin /var/www/html/phpmyadmin
rm -rf php*
cd
mkdir /usr/share/nginx/cache
rm -rf /etc/nginx/nginx.conf  /etc/php5/fpm/php.ini /etc/php5/fpm/pool.d/www.conf  /etc/nginx/sites-enabled/default
sed -i "s/ENABLED=\"false\"/ENABLED=\"true\"/g" /etc/default/sysstat
service sysstat restart
curl -o /etc/nginx/nginx.conf http://repo.crazytechindia.com/conf/nginx.conf
curl -o /etc/php5/fpm/php.ini http://repo.crazytechindia.com/conf/php.ini
curl -o /etc/php5/fpm/pool.d/www.conf http://repo.crazytechindia.com/conf/www.conf
curl -o /etc/nginx/sites-enabled/default http://repo.crazytechindia.com/conf/default
curl -o /etc/nginx/conf.d/cf.conf http://repo.crazytechindia.com/conf/cf.conf
curl -o /etc/fail2ban/jail.local http://repo.crazytechindia.com/conf/jail.local
curl -o /etc/fail2ban/filter.d/xmlrpc.conf http://repo.crazytechindia.com/conf/xmlrpc.conf
service nginx restart
service php5-fpm restart
service mysql restart
service fail2ban restart
clear
echo "Your Nginx Php Mysql setup for wordpress has been done successfully !"
