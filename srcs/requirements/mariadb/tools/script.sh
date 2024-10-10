#!/bin/bash

# Avvia MariaDB in background
service mariadb start

# Attendi che MariaDB sia pronto
until mysqladmin ping >/dev/null 2>&1; do
  sleep 1
done

# Ora esegui i comandi di configurazione
mysql -uroot -e "CREATE DATABASE IF NOT EXISTS $MARIADB_DATABASE;"
mysql -uroot -e "CREATE USER IF NOT EXISTS '$MARIADB_USER'@'localhost' IDENTIFIED BY '$MARIADB_USER_PASSWORD';"
mysql -uroot -e "GRANT ALL PRIVILEGES ON $MARIADB_DATABASE.* TO '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_USER_PASSWORD';"
mysql -uroot -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MARIADB_ROOT_PASSWORD';"
mysql -uroot -p$MARIADB_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"

mysqladmin -uroot -p$MARIADB_ROOT_PASSWORD shutdown

exec mysqld_safe