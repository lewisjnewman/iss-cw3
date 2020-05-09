# ISS CW3 NGINX Dockerfile
MAINTAINER "James Dorgan" <jd@warwick.ac.uk>


## added strace to be installed when we build the container 
RUN 	yum install epel-release -y && \
	yum update -y && \
	yum install -y \
	nginx \
	php \
	php-mysql \
	php-fpm \
	strace \
	audit audit-libs 

	
#COPY webfiles /data/www

COPY configfiles/nginx.conf /etc/nginx/nginx.conf
COPY configfiles/php.ini /etc/php.ini
COPY configfiles/www.conf /etc/php-fpm.d/www.conf
COPY webfiles/ /usr/share/nginx/html
COPY configfiles/docker-entrypoint.sh /

RUN rm -f /usr/share/nginx/html/index.html /usr/share/nginx/html/nginx-logo.png /usr/share/nginx/html/poweredby.png
RUN chown apache:apache /usr/share/nginx/html/*.php
RUN chmod +x /docker-entrypoint.sh
RUN curl -s https://s3.amazonaws.com/download.draios.com/stable/install-sysdig | bash

EXPOSE 80

ENTRYPOINT ["/docker-entrypoint.sh"]
