

#create and run the database container
docker run -d  -v mysql_volume:/var/lib/mysql/ --security-opt label:type:docker_mysql_t --security-opt seccomp=../runs/mysql/docker_mysql.json --security-opt no-new-privileges --net iss-cw3_net --ip 192.0.2.3 --hostname database --name mysql_c mysql_si

#create and run the webserver container/
docker run -d --security-opt label:type:docker_webserver_t --security-opt seccomp=../runs/webserver/docker_webserver.json --security-opt no-new-privileges --net iss-cw3_net --ip 192.0.2.10 --hostname webserver --add-host database:192.0.2.3 -p 80:80 --name webserver_c webserver_si



