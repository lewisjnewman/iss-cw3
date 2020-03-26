#!/bin/bash

source ./vars.sh

#stop the containers if they are running
docker stop $DATABASE_CONTAINER_NAME
docker stop $WEB_CONTAINER_NAME

#delete the containers
docker rm $DATABASE_CONTAINER_NAME
docker rm $WEB_CONTAINER_NAME

#delete the images
docker rmi $DATABASE_IMAGE_NAME
docker rmi $WEB_IMAGE_NAME
docker rmi $DATABASE_STRIPPED_IMAGE_NAME
docker rmi $WEB_STRIPPED_IMAGE_NAME

#delete the network
docker network rm $NETWORK_NAME
