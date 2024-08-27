#!/bin/bash
mysqld --bind-address=127.0.0.1 --user=root --data-dir=/data --skip-networking=0 & SQL_PID=$!

# Avvia MariaDB in background
mysqld_safe &

# Attendi che MariaDB sia pronto
until mysqladmin ping >/dev/null 2>&1; do
  echo -n "."; sleep 0.2
done

# Esegui le query di inizializzazione
echo "CREATE DATABASE IF NOT EXISTS mariadb;"
echo "CREATE USER IF NOT EXISTS 'grinella'@'%' IDENTIFIED BY 'root';"
echo "GRANT ALL PRIVILEGES ON mariadb.* TO 'grinella'@'%';"

# Ferma MariaDB
mysqladmin shutdown

kill $SQL_PID
wait $SQL_PID

mysqld --bind-address=127.0.0.1 --user=root --data-dir=/data --skip-networking=0