
#create docker network
docker network create --subnet=192.0.2.0/24 iss-cw3_net

#create docker volume for persistant database data
docker volume create --name database_volume

#create and run the database container
docker run -d  -v database_volume:/var/lib/mysql/ --net iss-cw3_net --ip 192.0.2.3 --hostname database -e MYSQL_ROOT_PASSWORD="test" -e MYSQL_DATABASE="data" --name database_c database_si

#10 second sleep so that the following command works
sleep 10

#setup the database
docker exec -i database_c mysql -uroot -ptest data < ./mysql/sqlconfig/data.sql

#stop and remove the temporary mysql container
docker stop database_c
docker rm database_c

#change into the mysql directory to build the selinux policy
cd ../mysql

#build and apply the database policy
make -f /usr/share/selinux/devel/Makefile docker_database.pp
semodule -i docker_database.pp

#change into the webserver directory to build the webserver policy
cd ../webserver

#build and apply the webserver policy
make -f /usr/share/selinux/devel/Makefile docker_webserver.pp
semodule -i docker_webserver.pp

