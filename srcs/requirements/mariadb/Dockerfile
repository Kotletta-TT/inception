FROM alpine:3

RUN apk update      \
&&                  \
apk add --no-cache  \
mariadb             \
mariadb-common      \
mariadb-client      \
busybox             \
openrc

RUN mkdir /run/openrc               \
    &&                              \
    touch /run/openrc/softlevel

# RUN addgroup -S mysql   \
# &&                      \
# adduser --ingroup       \
# mysql mysql

EXPOSE 3306

RUN rm -rf /etc/my.cnf.d/mariadb-server.cnf \
&&                                          \
rm -rf /etc/my.cnf                          \
&&                                          \
mkdir /usr/mariadb                          \
&&                                          \
mkdir /run/mysqld                           \
&&                                          \
mkdir /usr/dbdata
COPY tools/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf
COPY tools/my.cnf /etc/my.cnf

WORKDIR /usr/run
COPY tools/run.sh .