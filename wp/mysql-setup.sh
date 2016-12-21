#!/bin/bash

echo "=> Creating WordPress database"
mysql -uroot -e "CREATE DATABASE wordpress"
mysql -uroot -e "GRANT ALL PRIVILEGES ON wordpress.* TO root@localhost IDENTIFIED BY ''"
mysql -uroot -e "FLUSH PRIVILEGES"
echo "=> WordPress database created successfully"