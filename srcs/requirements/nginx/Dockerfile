FROM alpine:3.20.3

RUN apk update && apk add nginx openssl

RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt -subj "/C=IT/ST=Italy/L=Rome/O=42/OU=42/CN=grinella.42.fr"

COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY tools/script.sh /etc/nginx/script.sh

EXPOSE 443

ENTRYPOINT [ "/bin/sh","/tools/script.sh" ]
