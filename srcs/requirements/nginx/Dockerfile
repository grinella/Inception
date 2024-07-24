FROM nginx:latest

COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./tools/script.sh /entrypoint.sh
EXPOSE 443

#CMD ["nginx", "-g", "daemon off;"]
ENTRYPOINT [ "sh","entrypoint.sh" ]
