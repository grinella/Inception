#!/bin/bash

# Crea la directory per i certificati se non esiste
mkdir -p /etc/ssl/certs


# Genera il certificato SSL
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/nginx-selfsigned.key \
    -out /etc/ssl/certs/nginx-selfsigned.crt \
    -subj "/C=IT/L=Roma/O=42Roma/OU=student/CN=grinella.42.fr"

# Esegui NGINX
nginx -g "daemon off;"
