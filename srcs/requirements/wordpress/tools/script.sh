#!/bin/bash

sleep 20

mkdir -p /run/php

if [ ! -f "wp-config.php" ]; then
	wp config create 	--dbhost=mariadb:3306 --dbname=$MARIADB_DATABASE \
						--dbuser=$ADMIN_USER --dbpass=$ADMIN_PASSWORD \
						--path="/var/www/html" --allow-root

	wp core install	--url=$WP_URL --title=$WP_TITLE \
					--admin_user=$WP_ADMIN --admin_password=$ADMIN_PASSWORD \
					--admin_email="$WP_ADMIN_EMAIL" --allow-root

	wp user create	$WP_USER "$WP_USER_EMAIL" --user_pass=$WP_USER_PASSWORD \
					--role=$WP_USER_ROLE --porcelain --allow-root
	
	wp theme install astra --activate --allow-root
fi

/usr/sbin/php-fpm7.4 -F