#!/bin/bash

source ./vars.sh

echo Here: 1

#create the docker network
docker network create --subnet=$NETWORK_SUBNET $NETWORK_NAME

echo Here: 2

#start the sql server
docker run -d --net $NETWORK_NAME --ip $DATABASE_CONTAINER_IP --hostname $DATABASE_CONTAINER_HOSTNAME -e MYSQL_ROOT_PASSWORD="test" -e MYSQL_DATABASE="data" --name $DATABASE_CONTAINER_NAME $DATABASE_IMAGE_NAME

echo Here: 3

#populate the mysql database
docker exec -i $DATABASE_CONTAINER_NAME mysql -uroot -p "test" data < ./mysql/sqlconfig/data.sql

echo Here: 4

#start the webserver
docker run -d --net $NETWORK_NAME --ip $WEB_CONTAINER_IP --hostname $WEB_CONTAINER_HOSTNAME --add-host $DATABASE_CONTAINER_HOSTNAME:$DATABASE_CONTAINER_IP -p 80:80 --name $WEB_CONTAINER_NAME $WEB_STRIPPED_IMAGE_NAME

echo Here: 5