FROM alpine:3

# Install requirements packet
RUN apk update          \
    &&                  \
    apk add             \
    --no-cache          \
    libmcrypt-dev       \
    zlib-dev            \
    gmp-dev             \
    freetype-dev        \
    libjpeg-turbo-dev   \
    libpng-dev          \
    php7-fpm            \
    php7-json           \
    php7-zlib           \
    php7-xml            \
    php7-xmlwriter      \
    php7-simplexml      \
    php7-pdo            \
    php7-phar           \
    php7-openssl        \
    php7-pdo_mysql      \
    php7-mysqli         \
    php7-session        \
    php7-gd             \
    php7-iconv          \
    php7-mcrypt         \ 
    php7-gmp            \
    php7-zip            \
    php7-curl           \
    php7-opcache        \
    php7-ctype          \
    php7-apcu           \
    php7-intl           \
    php7-bcmath         \
    php7-dom            \
    php7-mbstring       \
    php7-xmlreader      \
    mysql-client        \
    curl                \
    busybox 

# Create custom user
RUN addgroup -S 4221
RUN adduser             \
    -s /bin/sh          \
    --disabled-password \
    --ingroup "4221"    \
    --no-create-home    \
    "aarson"

# Download source WordPress
WORKDIR /tmp/www
RUN curl -o /tmp/www/wp.tar.gz -fL                  \
    https://ru.wordpress.org/latest-ru_RU.tar.gz    \
    &&                                              \
    tar -xzf /tmp/www/wp.tar.gz                     \
    &&                                              \
    rm -rf /tmp/www/wp.tar.gz

RUN chown -R aarson:4221 /tmp/www && chmod -R 777 /tmp/www

ENV DB_NAME=wordpress
ENV DB_PORT=3306
ENV DB_HOST=db
ENV DB_PASSWORD=HellaB1eellTru8
ENV DB_USER=wordpress
ENV WP_ADMIN=admin
ENV WP_PASS=Passw0r9
ENV WP_MAIL=aarson@student.21-school.ru
ENV MYSQL_PASSWORD=Inception42
ENV MYSQL_USER=root

# Change config files
RUN sed -e                          \
"s/database_name_here/$DB_NAME/g;   \
s/username_here/$DB_USER/g;         \
s/password_here/$DB_PASSWORD/g;     \
s/localhost/$DB_HOST/g"             \
/tmp/www/wordpress/wp-config-sample.php > /tmp/www/wordpress/wp-config.php

# Download and install wp-cli
WORKDIR /tmp/wp-cli
RUN curl -O                                                                 \
https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar   \
&&                                                                          \
chmod +x wp-cli.phar                                                        \
&&                                                                          \
mv wp-cli.phar /usr/local/bin/wp

# Prepare to start script
WORKDIR /usr/run
COPY tools/run.sh . 
EXPOSE 9000

#TODO rules to files