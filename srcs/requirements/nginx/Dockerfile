FROM debian:bullseye

RUN apt-get update
RUN apt-get upgrade -y
RUN apt install -y nginx openssl

RUN mkdir -p /etc/nginx/ssl
RUN mkdir -p /var/log/nginx/inception_logs
RUN mkdir -p /var/nginx
RUN mkdir -p /var/www/html
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

COPY conf/test.conf /etc/nginx/nginx.conf
COPY tools/script.sh /etc/nginx/script.sh

EXPOSE 443

# RUN unset MARIADB_USER_PASSWORD MARIADB_ROOT_PASSWORD WP_ADMIN_PASSWORD WP_USER_PASSWORD

ENTRYPOINT [ "/bin/sh","/etc/nginx/script.sh" ]
