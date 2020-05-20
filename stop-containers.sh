

#stop and remove the database container
docker stop mysql_c
docker rm mysql_c

#stop and remove the webserver container
docker stop webserver_c
docker rm webserver_c

