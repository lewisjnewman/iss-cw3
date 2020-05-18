
#build the mysql image
docker build ../builds/mysql --tag database_i

#build the webserver image
docker build ../builds/webserver --tag nginx_server_i


#slim the webserver container
./docker-slim/docker-slim build --target nginx_server_i --http-probe --tag nginx_server_si --include-path='/var/run' --include-path='/var/log/nginx' --include-path='/var/cache/nginx' --include-path='/etc/passwd' --include-path='/etc/group' --include-path='/lib/*/libnss*' --include-path='/var/lib/nginx' --http-probe-cmd-file=probecmd.json --include-path='/usr/share/nginx'


#slim the mysql container
./docker-slim/docker-slim build --target database_i --http-probe=false --tag database_si --include-path='/var/lib/mysql-files' --include-path='/var/lib/mysql' --include-path='/var/run/mysqld/' --include-exe='mysql' --include-exe='ls' --include-exe='sleep' --include-exe='sed' --include-exe='awk' --include-path='/docker-entrypoint-initdb.d' --include-exe='mysql_tzinfo_to_sql' --include-exe='cat' --include-exe='mysqladmin'

