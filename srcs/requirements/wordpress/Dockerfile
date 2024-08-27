FROM alpine:3.20.2

RUN apk update && apk add -y \
    php7.3-fpm \
    php7.3-mysql \
    wget

RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xzvf latest.tar.gz && \
    mv wordpress /var/www/html/ && \
    rm latest.tar.gz

COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY conf/wp-config.php /var/www/html/wp-config.php

RUN chown -R www-data:www-data /var/www/html

EXPOSE 9000

CMD ["php-fpm7.3", "-F"]

