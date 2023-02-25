FROM debian:buster

RUN apt update
RUN apt upgrade -y

RUN apt-get install -y

RUN apt-get install -y php7.3 \
        php-fpm \
        php-mysql \
        mariadb-client

RUN apt-get install -y \
    php-curl php-mbstring php-xml php-zip php-mysqli \
    php7.3-fpm php7.3-common php7.3-mysql php7.3-mysqli php7.3-curl php7.3-mbstring php7.3-cli \

RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz
RUN chown -R root:root /var/www/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/auto_config.sh ./
RUN chmod +x ./auto_config.sh
EXPOSE 9000

ENTRYPOINT ["./auto_config.sh"]

