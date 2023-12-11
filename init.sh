#!/bin/sh

mariadbd-safe > /dev/null 2>&1 & mariadb-admin --silent --wait=30 ping

mariadb -uroot -e "CREATE USER 'bits'@'%' IDENTIFIED BY 'password'"
mariadb -uroot -e "GRANT ALL PRIVILEGES ON *.* TO 'bits'@'%' WITH GRANT OPTION"
mariadb -uroot -e "FLUSH PRIVILEGES"
mariadb -uroot -e "CREATE SCHEMA bits"

echo "=> Done!"

echo "========================================================================"
echo "You can now connect to this MariaDB Server using:"
echo ""
echo "    mariadb -ubits -ppassword -hlocalhost -P3306"
echo ""
echo "Please remember to change the above password as soon as possible!"
echo "MariaDB user 'root' has no password but only allows local connections"
echo "========================================================================"

mariadb-admin -uroot shutdown