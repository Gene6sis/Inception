#!/bin/sh

if [ ! -d "/var/lib/mysql/$MYSQL_DATABASE" ];
then
        mysql_install_db --datadir=/var/lib/mysql --user=mysql
        /etc/init.d/mysql start
        echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci" | mysql -u root
        echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'" | mysql -u root
        echo "GRANT ALL ON $MYSQL_DATABASE .* TO '$MYSQL_USER'@'%'" | mysql -u root
        echo "FLUSH PRIVILEGES;" | mysql -u root
        /etc/init.d/mysql stop
fi
exec /usr/sbin/mysqld
