#!/bin/bash
# Update and install dependencies
apt update -y
apt upgrade -y
apt install -y apache2 php php-mysql mysql-client wget unzip

# Install WordPress
cd /tmp
wget https://wordpress.org/latest.tar.gz
tar -xvzf latest.tar.gz
cp -r wordpress/* /var/www/html/

# Remove default Apache2 index.html
rm -f /var/www/html/index.html

# Set permissions
chown -R www-data:www-data /var/www/html/
chmod -R 755 /var/www/html/

# Create wp-config.php
cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
sed -i "s/database_name_here/${db_name}/" /var/www/html/wp-config.php
sed -i "s/username_here/${db_username}/" /var/www/html/wp-config.php
sed -i "s/password_here/${db_password}/" /var/www/html/wp-config.php
sed -i "s/localhost/${db_endpoint}/" /var/www/html/wp-config.php

# Fix MIME type for JavaScript files
echo "AddType application/javascript .js" >> /etc/apache2/conf-available/javascript.conf
a2enconf javascript

# Enable Apache modules and restart service
a2enmod rewrite
systemctl restart apache2

