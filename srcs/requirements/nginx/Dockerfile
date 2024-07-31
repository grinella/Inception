FROM nginx:latest

COPY ./conf/nginx.conf /etc/nginx/nginx.conf
# COPY ./tools/script.sh /entrypoint.sh
COPY ./tools/script.sh /docker-entrypoint.d/10-config.sh

RUN mkdir -p /etc/nginx/sites-available && \
    chmod +x /docker-entrypoint.d/10-config.sh

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
# ENTRYPOINT [ "sh","entrypoint.sh" ]
