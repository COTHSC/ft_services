#! /bin/sh

mariadb-install-db -u root

mysqld -u root & sleep 5

mysql -u root --execute="CREATE DATABASE wordpress;"

mysql -u root --execute="CREATE USER 'jean'@'%' IDENTIFIED BY '1'; GRANT ALL PRIVILEGES ON *.* TO 'jean'@'%' WITH GRANT OPTION; USE wordpress; FLUSH PRIVILEGES;"

sleep infinite
