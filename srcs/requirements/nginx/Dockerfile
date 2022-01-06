FROM alpine:3

RUN apk update && apk add --no-cache nginx && rm -rf /etc/nginx/http.d/*
WORKDIR /etc/nginx
COPY configs/* http.d/