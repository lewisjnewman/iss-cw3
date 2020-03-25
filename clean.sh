#!/bin/bash

#stop the containers if they are running
docker stop mysql-server_c
docker stop nginx-server_c

#delete the containers if they are running
docker rm mysql-server_c
docker rm nginx-server_c

#delete the images if they are running
docker rmi mysql-server_i
docker rmi nginx-server_i

docker network rm iss-cw3_net
