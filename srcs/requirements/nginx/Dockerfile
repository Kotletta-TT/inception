FROM alpine:3

RUN adduser                 \
    -s /bin/sh              \
    --disabled-password     \
    --ingroup "www-data"    \
    --no-create-home        \
    www-data

RUN apk update                  \
&&                              \
apk add --no-cache nginx        \
&& rm -rf /etc/nginx/nginx.conf /etc/nginx/http.d/*
WORKDIR /etc/nginx
COPY configs/nginx.conf .