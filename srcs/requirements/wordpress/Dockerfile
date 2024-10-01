FROM alpine:3.20.2

# RUN apk update && apk add curl php php-fpm php-mysqli php-curl php-dom php-exif php-fileinfo php-xml php-zip php-phar php-tokenizer

# RUN apk add mysql-client unzip

# COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
# COPY conf/wp-config.php /var/www/html/wp-config.php

# EXPOSE 9000

EXPOSE 9000
COPY tools/script.sh /usr/local/bin/tools/configure.sh
RUN	apk update && \
	apk upgrade && \
	apk add --no-cache mariadb-client php php-fpm php-cli php-phar php-mysqli php-mbstring php-openssl
    #&& \
	# sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" /etc/php82/php-fpm.d/www.conf && \
    # sed -i "s|;listen.owner = nobody|listen.owner = nobody|g" /etc/php82/php-fpm.d/www.conf && \
    # sed -i "s|;listen.group = nobody|listen.group = nobody|g" /etc/php82/php-fpm.d/www.conf

CMD ["/bin/sh", "/usr/local/bin/tools/configure.sh"]

