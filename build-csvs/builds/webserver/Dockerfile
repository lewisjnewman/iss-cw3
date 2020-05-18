# ISS CW3 NGINX Dockerfile

FROM centos:7

MAINTAINER "James Dorgan" <jd@warwick.ac.uk>

RUN 	yum install epel-release -y && \
	yum update -y && \
	yum install -y \
	nginx \
	php \
	php-mysql \
	php-fpm 
	
#COPY webfiles /data/www

COPY configfiles/nginx.conf /etc/nginx/nginx.conf
COPY configfiles/php.ini /etc/php.ini
COPY configfiles/www.conf /etc/php-fpm.d/www.conf
COPY webfiles/ /usr/share/nginx/html
COPY configfiles/docker-entrypoint.sh /

RUN rm -f /usr/share/nginx/html/index.html /usr/share/nginx/html/nginx-logo.png /usr/share/nginx/html/poweredby.png
RUN chown apache:apache /usr/share/nginx/html/*.php
RUN chmod +x /docker-entrypoint.sh

EXPOSE 80

ENTRYPOINT ["/docker-entrypoint.sh"]
