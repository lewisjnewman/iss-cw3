

#create and run the database container
docker run -d  -v database_volume:/var/lib/mysql/ --net iss-cw3_net --ip 192.0.2.3 --hostname database --name database_c database_si

#create and run the webserver container
docker run -d --security-opt seccomp=./nginx-seccomp.json --net iss-cw3_net --ip 192.0.2.10 --hostname webserver --add-host database:192.0.2.3 -p 80:80 --name nginx_server_c nginx_server_si



