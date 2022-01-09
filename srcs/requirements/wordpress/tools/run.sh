#!/bin/sh

if [[ ! -f /var/www/html/index.php ]]; then
mkdir -p /var/www/html      \
&&                          \
cd /var/www/html            \
&&                          \
wp core download            \
&&                          \
mysql                       \
--host=$DB_HOST             \
--port=$DB_PORT             \
--user=$MYSQL_USER          \
--password=$MYSQL_PASSWORD  \
-Bse                        \
"CREATE DATABASE $DB_NAME DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_USER';
SET PASSWORD FOR '$DB_USER'@'%' = PASSWORD('$DB_PASSWORD');
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;"
wp core config              \
--dbname=$DB_NAME           \
--dbuser=$DB_USER           \
--dbpass=$DB_PASSWORD       \
--dbhost=$DB_HOST           \
--dbprefix=wp_              \
&&                          \
wp core install             \
--url="$DOMAIN"             \
--title="$TITLE"            \
--admin_user="$WP_ADMIN"    \
--admin_password="$WP_PASS" \
--admin_email="$WP_MAIL"
fi

touch /var/log/php7/www.access.log
touch /var/log/php7/www.slow.log
chmod -R 777 /var/www/html
chown -R www-data:www-data /var/www
php-fpm7 -F -R