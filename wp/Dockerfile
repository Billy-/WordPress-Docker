FROM lamp

RUN apt-get install wget

RUN wget https://wordpress.org/latest.tar.gz

RUN tar -xzvf latest.tar.gz -C /var/www --strip-components=1

RUN chown www-data:www-data /var/www -R

ADD mysql-setup.sh /
