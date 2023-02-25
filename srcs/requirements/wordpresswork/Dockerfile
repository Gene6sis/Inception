FROM		debian:buster
LABEL		maintainer="robriard"

RUN			apt update -y && apt -y upgrade -y	\
&&			apt install -y php7.3 php7.3-fpm php-mysql mariadb-client wget	\
&&			wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar	\
&&			chmod +x wp-cli.phar	\
&&			mv wp-cli.phar /usr/local/bin/wp	\
&&			mkdir -p /run/php
COPY			./srcs/wp_entrypoint.sh /wp_entrypoint.sh
COPY			./srcs/www.conf /etc/php/7.3/fpm/pool.d/www.conf
RUN			echo "listen = 0.0.0.0:9000" >> /etc/php/7.3/fpm/pool.d/www.conf

RUN         chmod +x wp_entrypoint.sh

WORKDIR			/var/www/html
EXPOSE			9000
ENTRYPOINT		["/wp_entrypoint.sh"]

