#!/bin/bash

# Update and install MySQL
sudo apt-get update
sudo apt-get install -y mysql-server
sudo systemctl start mysql
sudo systemctl enable mysql

# Configure MySQL
 mysql -u root -e "CREATE DATABASE wordpress;"
mysql -u root -e "CREATE USER 'wordpress'@'192.168.56.2' IDENTIFIED BY 'wordpress@123';"
mysql -u root -e "GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, ALTER ON wordpress.* TO 'wordpress'@'192.168.56.2';"
mysql -u root -e "FLUSH PRIVILEGES;"

# Allow external connections
sudo sed -i "s/bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf

# Restart MySQL
sudo systemctl restart mysql


