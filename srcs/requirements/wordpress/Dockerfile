FROM debian:buster

RUN apt-get update -y && apt upgrade -y && apt-get install wget -y

RUN apt-get install lsof -y

RUN apt-get install mariadb-client -y

RUN apt install -y lsb-release ca-certificates apt-transport-https software-properties-common gnupg2
RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/sury-php.list
RUN wget -qO - https://packages.sury.org/php/apt.gpg | apt-key add -
RUN apt update -y

RUN apt install -y php8.0-fpm \
    php8.0-gd \
    php8.0-xml \ 
    php8.0-zip \
    php8.0-imagick \
    php8.0-mbstring \
    php8.0-mysql

RUN mkdir -p /run/php/

WORKDIR /tmp
RUN wget https://wordpress.org/latest.tar.gz && tar -xvzf latest.tar.gz

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

#COPY tools/my-wp-config.php /tmp/wp-config.php
COPY tools/start_wp.sh /start_wp.sh
COPY tools/index.html /tmp/index.html
COPY tools/www.conf /etc/php/8.0/fpm/pool.d/www.conf
COPY tools/setup-wp.sh /tmp/setup-wp.sh

WORKDIR /var/www/html/wordpress

EXPOSE 9000