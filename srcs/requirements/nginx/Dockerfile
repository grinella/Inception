FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y \
    nginx \
    bash \
    openssl \
    && rm -rf /var/lib/apt/lists/*

COPY ./conf/nginx.conf /etc/nginx/conf.d/default.conf
# COPY ./tools/script.sh /entrypoint.sh
COPY ./tools/script.sh /docker-entrypoint.d/10-config.sh

RUN mkdir -p /etc/nginx/sites-available && \
    chmod +x /docker-entrypoint.d/10-config.sh

EXPOSE 443

# CMD ["nginx", "-g", "daemon off;"]
CMD [ "sh","script.sh" ]
