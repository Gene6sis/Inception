#!/bin/bash

sleep 10

if [ ! -f /var/www/html/wp-config.php ]; then
  wp config create --dbname=$WORDPRESS_DB_NAME --dbuser=$WORDPRESS_DB_USER --dbpass=$WORDPRESS_DB_PASSWORD --dbhost=$WORDPRESS_DB_HOST --extra-php <<PHP
define( 'WP_REDIS_HOST', '$REDIS_HOST' );
define( 'WP_CACHE_KEY_SALT', 'wordpress:' );
PHP
fi

/usr/sbin/php-fpm7.3 -F
