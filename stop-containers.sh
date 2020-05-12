

#stop and remove the database container
docker stop database_c
docker rm database_c

#stop and remove the webserver container
docker stop nginx_server_c
docker rm nginx_server_c

docker network rm iss-cw3_net
