#!/bin/sh

mv /tmp/setup-wp.sh /var/www/html/wordpress/
sh /var/www/html/wordpress/setup-wp.sh
#sleep 10
/usr/sbin/php-fpm8.0 -F -R