#!/bin/bash

# Crea la directory per i certificati se non esiste
mkdir -p /etc/ssl/certs


# Genera il certificato SSL
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/nginx-selfsigned.key \
    -out /etc/ssl/certs/nginx-selfsigned.crt \
    -subj "/C=IT/L=Roma/O=42Roma/OU=student/CN=grinella.42.fr"

# Crea la configurazione di NGINX
# cat > /etc/nginx/conf.d/default.conf <<EOF
# server {
#     listen 443 ssl;
#     listen [::]:443 ssl;

#     ssl_certificate /etc/ssl/certs/nginx-selfsigned.crt;
#     ssl_certificate_key /etc/ssl/private/nginx-selfsigned.key;
#     ssl_protocols TLSv1.3;

#     index index.php;
#     root /var/www/html;

#     location ~ \.php$ { 
#         try_files \$uri =404;
#         fastcgi_pass wordpress:9000;
#         include fastcgi_params;
#         fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
#     }
# }
# EOF

# Esegui NGINX
exec nginx -g "daemon off;"
