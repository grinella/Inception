FROM debian:bullseye

EXPOSE 9000

RUN	apt update 
RUN	apt upgrade -y
RUN	apt install -y mariadb-client php php-fpm php-cli php-phar php-mysql php-mbstring php-curl php-xml php-gd curl 
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

WORKDIR /var/www/html

RUN wp core download --allow-root
RUN chown -R www-data:www-data /var/www/html

COPY ./tools/script.sh /configure.sh
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf


ENTRYPOINT ["bash", "/configure.sh"]

