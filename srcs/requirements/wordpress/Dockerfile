FROM alpine:3

RUN apk update && apk add --no-cache libmcrypt-dev zlib-dev gmp-dev \
    freetype-dev libjpeg-turbo-dev libpng-dev php7-fpm php7-json php7-zlib \
    php7-xml php7-xmlwriter php7-simplexml php7-pdo php7-phar php7-openssl \
    php7-pdo_mysql php7-mysqli php7-session php7-gd php7-iconv php7-mcrypt \ 
    php7-gmp php7-zip php7-curl php7-opcache php7-ctype php7-apcu php7-intl \
    php7-bcmath php7-dom php7-mbstring php7-xmlreader mysql-client curl

WORKDIR /usr/src/www
RUN curl -o /usr/src/www/wp.tar.gz -fL \
    https://ru.wordpress.org/latest-ru_RU.tar.gz && \
    tar -xzf /usr/src/www/wp.tar.gz && rm -rf /usr/src/www/wp.tar.gz

ENV DB_NAME=wordpress
ENV DB_PORT=3306
ENV DB_HOST=db
ENV DB_PASSWORD=HellaB1eellTru8
ENV DB_USER=wordpress

WORKDIR /usr/src/www/wordpress
RUN sed -e "s/database_name_here/$DB_NAME/g; s/username_here/$DB_USER/g; \
s/password_here/$DB_PASSWORD/g; s/localhost/$DB_HOST/g" wp-config-sample.php > wp-config.php

VOLUME [ "/usr/src/www/wordpress" ]
EXPOSE 9000

#TODO rules to files
#TODO solove problem to copy files