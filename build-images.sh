#!/bin/bash

source ./vars.sh

function build_mysql(){
    # build the mysql image
    docker build ./mysql --tag $DATABASE_IMAGE_NAME
}

function build_webserver(){
    # build the webserver image
    docker build ./webserver --tag $WEB_IMAGE_NAME

    # create a stripped webserver image
    ./strip-image.sh -i nginx -t $WEB_STRIPPED_IMAGE_NAME  \
        -p nginx  \
        -p php \
        -p php-mysql \
        -p php-fpm \
        -f /etc/passwd \
        -f /etc/group \
        -f '/lib/*/libnss*' \
        -f /bin/ls \
        -f /bin/cat \
        -f /bin/sh \
        -f /bin/mkdir \
        -f /bin/ps \
        -f /var/run \
        -f /var/log/nginx
}

echo "New Build:" >> build_mysql.log
echo "New Build:" >> build_webserver.log
build_mysql &>> build_mysql.log &
fork1_pid=$!

build_webserver &>> build_webserver.log &
fork2_pid=$!

echo "Forks Started"

wait $fork1_pid
wait $fork2_pid

echo "Done"