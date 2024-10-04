#!/bin/bash

# Attende che MariaDB sia pronto per accettare connessioni
while ! mysql -h${DB_HOST} -u${ADMIN_USER} -p${ADMIN_PASSWORD} ${MYSQL_DATABASE} -e ";" &> /dev/null; do 
    sleep 3
done

# Crea la directory per nginx e prepara la configurazione di WordPress
mkdir /var/www/html

cd /var/www/html

# Pulisce la directory
rm -rf *

# Scarica WP-CLI
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
chmod +x wp-cli.phar 
mv wp-cli.phar /usr/local/bin/wp

# Scarica WordPress
wp core download --allow-root

# Configura WordPress
mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

sed -i -r "s/database_name_here/$MYSQL_DATABASE/1" wp-config.php
sed -i -r "s/username_here/$ADMIN_USER/1" wp-config.php
sed -i -r "s/password_here/$ADMIN_PASSWORD/1" wp-config.php

# Installa WordPress
wp core install --url=${DOMAIN_NAME}/ --title="${WP_TITLE}" --admin_user=${ADMIN_USER} --admin_password=${ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL} --skip-email --allow-root

# Crea un utente
wp user create ${ADMIN_USER} ${WP_ADMIN_EMAIL} --role=author --user_pass=${ADMIN_PASSWORD} --allow-root

# Installa e attiva il tema e plugin
wp theme install astra --activate --allow-root
wp plugin install redis-cache --activate --allow-root
wp plugin update --all --allow-root

# Modifica le configurazioni di PHP-FPM
sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf

# Crea la directory per PHP
mkdir /run/php

# Abilita Redis per WordPress
wp redis enable --allow-root

# Avvia PHP-FPM
/usr/sbin/php-fpm7.3 -F


# #!/bin/bash

# while ! mysql -h${DB_HOST} -u${ADMIN_USER} -p${ADMIN_PASSWORD} ${DB_NAME} -e ";" &> /dev/null; do 
#     sleep 3
# done

# # create directory to use in nginx container later and also to setup the wordpress conf
# mkdir /var/www/html

# cd /var/www/html


# rm -rf *

# curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 

# chmod +x wp-cli.phar 

# mv wp-cli.phar /usr/local/bin/wp


# wp core download --allow-root

# mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

# mv /wp-config.php /var/www/html/wp-config.php


# sed -i -r "s/db1/$DB_NAME/1"   wp-config.php
# sed -i -r "s/user/$ADMIN_USER/1"  wp-config.php
# sed -i -r "s/pwd/$ADMIN_PASSWORD/1"    wp-config.php

# wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root




# wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root


# wp theme install astra --activate --allow-root


# wp plugin install redis-cache --activate --allow-root

# wp plugin update --all --allow-root


 
# sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf

# mkdir /run/php



# wp redis enable --allow-root

# /usr/sbin/php-fpm7.3 -F