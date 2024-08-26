FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y \
    nginx \
    bash \
    openssl \
    && rm -rf /var/lib/apt/lists/*

COPY ./conf/nginx.conf /etc/nginx/conf.d/default.conf
# COPY ./tools/script.sh /entrypoint.sh
COPY ./tools/script.sh /docker-entrypoint.d/script.sh

RUN mkdir -p /etc/nginx/sites-available && \
    chmod +x /docker-entrypoint.d/script.sh

RUN mkdir -p /etc/ssl/certs

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/nginx-selfsigned.key \
    -out /etc/ssl/certs/nginx-selfsigned.crt \
    -subj "/C=IT/L=Roma/O=42Roma/OU=student/CN=grinella.42.fr"

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
# CMD [ "sh","script.sh" ]
