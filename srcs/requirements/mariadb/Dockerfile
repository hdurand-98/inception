FROM alpine:3.14.3
LABEL maintainer="hdurand@student.42.fr"

RUN apk update && apk upgrade && apk add --no-cache \
    mariadb \
    mariadb-client

COPY tools/initmdb.sh /tmp/initmdb.sh