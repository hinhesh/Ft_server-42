#getting base image debian buster
FROM debian:buster

#update software packages in debian
RUN apt-get update  
RUN apt-get upgrade -y
RUN apt-get -y install mariadb-server
#RUN apt-get install vim
#wget command will be used to get .tar file of phpmyadmin and wordpress, so install it in advance.
RUN apt-get -y install wget
#installer nginx
RUN apt-get -y install nginx
#installer Install MySQL/MariaDB
RUN apt-get -y install mariadb-server
#installer OPEN SSL genere 2 fichiers du certificat SSL
RUN apt-get install openssl
#installer php
RUN apt-get install -y php7.3 php7.3-fpm  php7.3-mysql php-common php7.3-cli php7.3-common php7.3-json php7.3-opcache php7.3-readline php-mbstring
#Installer configurer phpmyadmin
#RUN apt-get install -y  php-zip php-gd
#RUN apt-get install -y php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip

COPY execut.sh ./
COPY default ./
COPY config.inc.php ./
COPY wp-config.php ./