# Ft_server-42
The goal of ft_server is to create a web server with Nginx capable of running a WordPress website, phpMyAdmin, and a MySQL database. This server will run in only one Docker container, under Debian Buster.
To compile : 
1) Open your terminal
2) git clone git@github.com:hinhesh/ft_server.git && cd ft_server
3) docker build -t ft_server .
4) docker run --name ft_server -d -p 443:443 -p 80:80 ft_server
5) bash execut.sh
