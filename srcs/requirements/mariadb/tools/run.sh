#!/bin/sh

mysql_install_db --user=root
rc-service mariadb restart
rc-service mariadb stop
mariadbd --user=root