FROM ubuntu:trusty
MAINTAINER Billy Mathews <billy@bilym.co.uk>

# Install packages
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
  apt-get -y install wget supervisor git apache2 libapache2-mod-php5 mysql-server php5-mysql pwgen php-apc php5-mcrypt

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Install WordPress
RUN rm -rf /var/www && mkdir /var/www
RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xzvf latest.tar.gz -C /var/www --strip-components=1
RUN chown www-data:www-data /var/www -R

# Remove pre-installed database
RUN rm -rf /var/lib/mysql/*

# config to enable .htaccess
COPY apache_default /etc/apache2/sites-available/000-default.conf
RUN a2enmod rewrite

#Environment variables to configure php
ENV PHP_UPLOAD_MAX_FILESIZE 10M
ENV PHP_POST_MAX_SIZE 10M

# Add image configuration and scripts
COPY start-apache2.sh start-mysqld.sh init.sh run.sh  /
RUN chmod 755 /*.sh

COPY my.cnf /etc/mysql/conf.d/my.cnf
COPY supervisord-apache2.conf supervisord-mysqld.conf /etc/supervisor/conf.d/

# Add volumes
VOLUME ["/etc/mysql", "/var/lib/mysql", "/var/www"]

EXPOSE 80 3306
CMD ["/run.sh"]
