#!/bin/bash

echo "=> Installing MySQL ..."
mysql_install_db > /dev/null 2>&1
echo "=> Done!"

/usr/bin/mysqld_safe > /dev/null 2>&1 &

RET=1
while [[ RET -ne 0 ]]; do
    echo "=> Waiting for confirmation of MySQL service startup"
    sleep 5
    mysql -uroot -e "status" > /dev/null 2>&1
    RET=$?
done

#db_user='admin'
#db_pass=${MYSQL_PASS:-$(pwgen -s 12 1)}
#_word=$( [ ${MYSQL_PASS} ] && echo "preset" || echo "random" )
#echo "=> Creating MySQL admin user with ${_word} password"

#mysql -uroot -e "CREATE USER '${db_user}'@'%' IDENTIFIED BY '$db_pass'"
#mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO '${db_user}'@'%' WITH GRANT OPTION"

echo "=> Creating WordPress database"
mysql -uroot -e "CREATE DATABASE wordpress"
mysql -uroot -e "GRANT ALL PRIVILEGES ON wordpress.* TO root@localhost IDENTIFIED BY ''"
mysql -uroot -e "FLUSH PRIVILEGES"
echo "=> WordPress database created successfully"

# echo "=> Done!"

# echo "========================================================================"
# echo "You can now connect to this MySQL Server using:"
# echo ""
# echo "    mysql -uadmin -p$db_pass -h<host> -P<port>"
# echo ""
# echo "Please remember to change the above password as soon as possible!"
# echo "MySQL user 'root' has no password but only allows local connections"
# echo "========================================================================"

mysqladmin -uroot shutdown

cp /var/www/wp-config-sample.php /var/www/wp-config.php

sed -i -e 's/database_name_here/wordpress/' \
  -e 's/username_here/root/' \
  -e 's/password_here//' \
  -e 's/\x27WP_DEBUG\x27, false/\x27WP_DEBUG\x27, true/' /var/www/wp-config.php
