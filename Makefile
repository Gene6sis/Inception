all: up

up :
	cd srcs && sudo service docker restart \
        && sudo docker-compose build --no-cache \
        && sudo docker-compose  up -d --force-recreate

down :
	cd srcs && sudo docker-compose down -v

clean:
	cd srcs && sudo docker-compose down \
        && sudo docker system prune -a \
        && sudo docker volume rm srcs_mariadb_data srcs_wordpress_data \
	&& sudo rm -rf /home/adben-mc/data/wordpress/* \
        && sudo rm -rf /home/adben-mc/data/mariadb/*
re:     clean up

.PHONY: up down re clean

