
#create docker network
docker network create --subnet=192.0.2.0/24 iss-cw3_net

#create docker volume for persistant database data
docker volume create --name mysql_volume

#create and run the database container
docker run -d  -v mysql_volume:/var/lib/mysql/ --net iss-cw3_net --ip 192.0.2.3 --hostname database -e MYSQL_ROOT_PASSWORD="test" -e MYSQL_DATABASE="data" --name mysql_c mysql_si

#10 second sleep so that the following command works
sleep 20

#setup the database
docker exec -i database_c mysql -uroot -ptest data < ../runs/mysql/data.sql

#stop and remove the temporary mysql container
docker stop database_c
docker rm database_c

#change into the mysql directory to build the selinux policy
cd ../runs/mysql

#build and apply the database policy
make -f /usr/share/selinux/devel/Makefile docker_mysql.pp
semodule -i docker_mysql.pp

#change into the webserver directory to build the webserver policy
cd ../webserver

#build and apply the webserver policy
make -f /usr/share/selinux/devel/Makefile docker_webserver.pp
semodule -i docker_webserver.pp

