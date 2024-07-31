#!/bin/bash

set -e

# Avvia MariaDB in background
mysqld_safe &

# Attendi che MariaDB sia pronto
until mysqladmin ping >/dev/null 2>&1; do
  echo -n "."; sleep 0.2
done

# Esegui le query di inizializzazione
mysql -e "CREATE DATABASE IF NOT EXISTS mariadb;"
mysql -e "CREATE USER IF NOT EXISTS 'grinella'@'%' IDENTIFIED BY 'root';"
mysql -e "GRANT ALL PRIVILEGES ON mariadb.* TO 'grinella'@'%';"

# Ferma MariaDB
mysqladmin shutdown

# Esci dallo script
exit 0







#---------------------------------------------

# service mariadb start

# echo "CREATE DATABASE IF NOT EXISTS mariadb;" | mariadb -u root -p1234
# sleep .15

# echo "CREATE USER IF NOT EXISTS 'grinella'@'%' IDENTIFIED BY 'root' ;" >> mariadb -u root -p1234
# sleep .15

# echo "GRANT ALL PRIVILEGES ON mariadb.* TO 'grinella'@'%' ;" >> mariadb -u root -p1234
# sleep .15

# service mariadb stop



#--------------------------------------------------------------


# service mariadb start

# echo "CREATE DATABASE IF NOT EXISTS mariadb;" | mariadb -u root -p1234
# sleep .15

# echo "CREATE USER IF NOT EXISTS 'grinella'@'%' IDENTIFIED BY 'root';" | mariadb -u root -p1234
# sleep .15

# echo "GRANT ALL PRIVILEGES ON mariadb.* TO 'grinella'@'%';" | mariadb -u root -p1234
# sleep .15

# service mariadb stop