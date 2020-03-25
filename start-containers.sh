#!/bin/bash

#create the docker network
docker network create --subnet=192.0.2.0/24 iss-cw3_net

#start the sql server
docker run -d --net iss-cw3_net --ip 192.0.2.3 --hostname database -e MYSQL_ROOT_PASSWORD="test" -e MYSQL_DATABASE="data" --name mysql-server_c mysql-server_i

#populate the mysql database
docker exec -i mysql-server_c mysql -uroot -p "test" data < sqlconfig/data.sql

#start the webserver
docker run -d --net iss-cw3_net --ip 192.0.2.10 --hostname webserver --ad-host database:192.0.2.3 -p 80:80 --name nginx-server_c nginx-server_i


