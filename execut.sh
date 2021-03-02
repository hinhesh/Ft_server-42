#nginx
mkdir var/www/file
mv ./default etc/nginx/sites-available
mkdir /etc/nginx/ssl
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/localhost.pem -keyout /etc/nginx/ssl/localhost.key -subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=ines/CN=localhost"

#MariaDB/SQL
service nginx start
service mysql start
service php7.3-fpm start
#creation d'une database appellée wordpress 
echo "CREATE DATABASE wordpress;" | mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost' WITH GRANT OPTION;" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password
echo "update mysql.user set plugin='mysql_native_password' where user='root';" | mysql -u root --skip-password


#phpMyAdmin
wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-english.tar.gz
tar -xf phpMyAdmin-5.0.1-english.tar.gz && rm -rf phpMyAdmin-5.0.1-english.tar.gz
mv phpMyAdmin-5.0.1-english phpmyadmin
mv phpmyadmin ./var/www/html
mv ./config.inc.php ./var/www/html/phpmyadmin
service php7.3-fpm start


#wordpress 
wget https://wordpress.org/latest.tar.gz
tar -xvzf latest.tar.gz && rm -rf latest.tar.gz
mv wp-config.php wordpress
mv wordpress ./var/www/html/wordpress


service php7.3-fpm restart
service nginx start