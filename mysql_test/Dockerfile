# ISS CW3 Database Dockerfile

FROM mysql:5
# installing strace on mysql
RUN apt-get update -y \
    apt-get upgrade -y \
    apt-get install strace -y

COPY configfiles/mysqld.cnf  /mysql/mysql.conf.d/mysqld.cnf

EXPOSE 3306
