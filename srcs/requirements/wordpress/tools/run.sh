#!/bin/sh

mv /tmp/www /var                \
chown -R aarson:4221 /var/www   \
&&                              \
chmod -R 777 /var/www

mysql                       \
--host=$DB_HOST             \
--port=$DB_PORT             \
--user=$MYSQL_USER          \
--password=$MYSQL_PASSWORD  \
-Bse                        \
"CREATE DATABASE $DB_NAME DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
CREATE USER '$DB_USER'@'%' IDENTIFIED WITH mysql_native_password BY '$DB_PASSWORD';
GRANT ALL ON $DB_NAME.* TO '$DB_USER'@'%';
FLUSH PRIVILEGES;
EXIT;"

wp core install             \
--path=/var/www/wordpress   \
--url="$DOMAIN"             \
--title="$TITLE"            \
--admin_user="$WP_ADMIN"    \
--admin_password="$WP_PASS" \
--admin_email="$WP_MAIL"

php-fpm7 -F -R