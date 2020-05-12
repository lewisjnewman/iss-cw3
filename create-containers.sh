
#create docker network
docker network create --subnet=192.0.2.0/24 iss-cw3_net

#create and run the database container
docker run -d --net iss-cw3_net --ip 192.0.2.3 --hostname database -e MYSQL_ROOT_PASSWORD="test" -e MYSQL_DATABASE="data" --name database_c database_i

#pre configure the database
docker exec -i database_c mysql -uroot -ptest data < ./mysql/sqlconfig/data.sql

#create and run the webserver container
docker run -d --net iss-cw3_net --ip 192.0.2.10 --hostname webserver --add-host database:192.0.2.3 -p 80:80 --name nginx_server_c nginx_server_i



