#!/bin/bash
service mariadb start

echo "CREATE DATABASE IF NOT EXISTS mariadb;" | mariadb -u root -p1234
sleep .15

echo "CREATE USER IF NOT EXISTS 'grinella'@'%' IDENTIFIED BY 'root' ;" >> mariadb -u root -p1234
sleep .15

echo "GRANT ALL PRIVILEGES ON mariadb.* TO 'grinella'@'%' ;" >> mariadb -u root -p1234
sleep .15

service mariadb stop


# service mariadb start

# echo "CREATE DATABASE IF NOT EXISTS mariadb;" | mariadb -u root -p1234
# sleep .15

# echo "CREATE USER IF NOT EXISTS 'grinella'@'%' IDENTIFIED BY 'root';" | mariadb -u root -p1234
# sleep .15

# echo "GRANT ALL PRIVILEGES ON mariadb.* TO 'grinella'@'%';" | mariadb -u root -p1234
# sleep .15

# service mariadb stop