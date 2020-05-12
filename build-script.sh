
#build the mysql image
docker build mysql --tag database_i


#build the webserver image
docker build webserver --tag nginx_server_i

