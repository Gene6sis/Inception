FROM debian:buster

RUN apt update
RUN apt upgrade -y
RUN apt-get install mariadb-server -y

COPY conf/mariadb-entrypoint.sh /etc/mysql/entrypoint.sh
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306
ENTRYPOINT	["/bin/sh", "/etc/mysql/entrypoint.sh"]
