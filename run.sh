#!/bin/sh

VOLUME_HOME="/var/lib/mysql"

if [[ ! -d $VOLUME_HOME/mysql ]]; then
    echo "=> An empty or uninitialized MariaDB detected in $VOLUME_HOME"
    echo "=> Installing MariaDB ..."
    mariadb-install-db > /dev/null 2>&1
    echo "=> Done ..."  
    sh /usr/local/bin/init.sh
else
    echo "=> Using an existing volume of MariaDB"
fi

exec mariadbd-safe