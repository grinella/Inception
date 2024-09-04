#!/bin/bash

mysql_install_db --user=root
mysql_upgrade
mysqld --bind-address=127.0.0.1 --user=root --datadir=/data --skip-networking=0 & SQL_PID=$!

# Avvia MariaDB in background
# mysqld_safe &

# # Attendi che MariaDB sia pronto
# until mysqladmin ping >/dev/null 2>&1; do
#   echo -n "."; sleep 0.2
# done

# Esegui le query di inizializzazione
echo "CREATE DATABASE IF NOT EXISTS test;" | mysql -u root
echo "CREATE USER IF NOT EXISTS 'grinella'@'%' IDENTIFIED BY 'root';" | mysql -u root
echo "GRANT ALL PRIVILEGES ON test.* TO 'grinella'@'%';" | mysql -u root


# Ferma MariaDB
# mysqladmin shutdown

kill $SQL_PID
wait $SQL_PID

mysqld --bind-address=127.0.0.1 --user=root --datadir=/data --skip-networking=0