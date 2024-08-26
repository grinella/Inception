FROM wordpress:6.6.1-php8.3-fpm

COPY ./conf/wp-config.php /var/www/html/wp-config.php

EXPOSE 80

CMD ["apache2-foreground"]
