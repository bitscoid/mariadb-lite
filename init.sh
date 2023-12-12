#!/bin/sh

mariadbd-safe > /dev/null 2>&1 & mariadb-admin --silent --wait=30 ping

mariadb -uroot -e "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASS}'"
mariadb -uroot -e "GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}'@'%' WITH GRANT OPTION"
mariadb -uroot -e "FLUSH PRIVILEGES"
mariadb -uroot -e "CREATE DATABASE $MYSQL_NAME"

echo "=> Done!"

echo "========================================================================"
echo "You can now connect to this MariaDB Server using:"
echo ""
echo "    mariadb -u$MYSQL_USER -p$MYSQL_PASS -hlocalhost -P3306"
echo ""
echo "Please remember to change the above password as soon as possible!"
echo "MariaDB user 'root' has no password but only allows local connections"
echo "========================================================================"

mariadb-admin -uroot shutdown