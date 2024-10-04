#!/bin/bash

# Inizializza il database di MariaDB
mysql_install_db --user=root
mysql_upgrade
mysqld --bind-address=127.0.0.1 --user=root --datadir=/data --skip-networking=0 & SQL_PID=$!

sleep 5

# Esegui le query di inizializzazione
echo "CREATE DATABASE ${MYSQL_DATABASE};" | mysql -u root
echo "CREATE USER '${ADMIN_USER}'@'%' IDENTIFIED BY '${ADMIN_PASSWORD}';" | mysql -u root
echo "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${ADMIN_USER}'@'%';" | mysql -u root

echo "FLUSH PRIVILEGES;" | mysql -u root

# Ferma MariaDB
kill $SQL_PID
wait $SQL_PID

# Avvia MariaDB
mysqld --bind-address=0.0.0.0 --user=root --datadir=/data --skip-networking=0


# #!/bin/bash

# mysql_install_db --user=root
# mysql_upgrade
# mysqld --bind-address=127.0.0.1 --user=root --datadir=/data --skip-networking=0 & SQL_PID=$!

# sleep 5

# # Avvia MariaDB in background
# # mysqld_safe &

# # # Attendi che MariaDB sia pronto
# # until mysqladmin ping >/dev/null 2>&1; do
# #   echo -n "."; sleep 0.2
# # done

# # Esegui le query di inizializzazione
# echo "CREATE DATABASE $DB_NAME;" | mysql -u root
# echo "CREATE USER '$ADMIN_USER'@'%' IDENTIFIED BY '$ADMIN_PASSWORD';" | mysql -u root
# echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$ADMIN_USER'@'%';" | mysql -u root

# echo "FLUSH PRIVILEGES;" | mysql -u root


# # Ferma MariaDB
# # mysqladmin shutdown

# kill $SQL_PID
# wait $SQL_PID

# mysqld --bind-address=0.0.0.0 --user=root --datadir=/data --skip-networking=0
