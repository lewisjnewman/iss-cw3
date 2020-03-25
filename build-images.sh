# build the mysql image
docker build ./mysql --tag mysql-server_i

# build the webserver image
docker build ./webserver --tag nginx-server_i
