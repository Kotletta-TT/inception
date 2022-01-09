#!/bin/sh

if [[ ! -d $DB_DATA_DIR/mysql ]]; then
mysql_install_db --user=$MYSQL_USER
mariadbd --user=$MYSQL_USER & \
sleep 5 && \
mariadb --user=$MYSQL_USER -Bse \
"SET PASSWORD FOR 'root'@localhost = PASSWORD('$MYSQL_PASSWORD');
CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_USER';
SET PASSWORD FOR 'root'@'%' = PASSWORD('$MYSQL_PASSWORD');
GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;"
else
mariadbd --user=$MYSQL_USER
fi