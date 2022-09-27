#!/bin/sh

cp /tmp/index.html /var/www/html/
cp -R /tmp/wordpress/ /var/www/html/

chown -R www-data:www-data /var/www/html/wordpress

sleep 3

wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$USER_PWD --dbhost=mariadb --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root
wp core install --url=hdurand.42.fr/wordpress --title="Ardent Azur" --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_MAIL --skip-email --allow-root
wp option update blogdescription "Le meilleur jeu de la Terre" --allow-root
wp user create $WP_USER $WP_USER_MAIL --role=author --user_pass=$WP_USER_PWD --allow-root
wp post generate --post_title='Oui, il a une page Steam' --count=1 --allow-root
wp post generate --post_title='Alors je vous ordonne d aller le wishlist' --count=1 --allow-root
wp theme install rookie --activate --allow-root