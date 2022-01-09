FROM alpine:3

# Install requirements program
RUN apk update      \
&&                  \
apk add --no-cache  \
mariadb             \
mariadb-common      \
mariadb-client      \
busybox             \
openrc

# Start light-analog systemd 
RUN mkdir /run/openrc           \
    &&                          \
    touch /run/openrc/softlevel

# Create custom user
# RUN addgroup -S mysql   \
# &&                      \
# adduser --ingroup       \
# mysql mysql             \
# &&                      \
# rm -rf /var/lib/mysql   \
# &&                      \
# mkdir -p /var/lib/mysql \
# /var/run/mysqld         \
# &&                      \
# chmod 777 /var/run/mysqld;


ENV DB_DATA_DIR=/usr/dbdata
ENV DB_SOCK_DIR=/usr/mariadb
ENV DB_PORT=3306
ENV DB_SOCK_DIR=/run/mysqld

# Auto-create config file
RUN rm -rf /etc/my.cnf      \
&&                          \
mkdir $DB_DATA_DIR          \
&&                          \
mkdir -p $DB_SOCK_DIR       \
&&                          \
echo -en "[client-server]\n\
socket                  = $DB_SOCK_DIR/mariadb.sock\n\
[mysqld]\n\
socket                  = $DB_SOCK_DIR/mariadb.sock\n\
datadir                 = ${DB_DATA_DIR}\n\
port                    = ${DB_PORT}\n\
bind-address            = 0.0.0.0\n" > /etc/my.cnf
# COPY tools/mariadb /etc/init.d

EXPOSE ${DB_PORT}
# VOLUME /var/lib/mysql

# Prepare run script
WORKDIR /usr/run

COPY tools/run.sh .