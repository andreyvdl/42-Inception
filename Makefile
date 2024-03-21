VOLUME_PATH=/home/adantas-/data
COMPOSE=./srcs/docker-compose.yml

all: permission config up
.PHONY: all

permission:
	@/usr/bin/echo -e '\033[1;33mGIVE ME YOUR SUDO PERMISSION!\033[0m'
	@sudo /usr/bin/echo -e '\033[1;31mYOU FOOL! I NOW HAVE FULL CONTROL\033[0m'
.PHONY: permission

config:
	@sudo chmod 666 /etc/hosts
	@if ! grep -q 'adantas-' /etc/hosts; then \
		sudo echo '127.0.0.0 adantas-.42.fr' >> /etc/hosts; \
	fi
	@if [ ! -d "${VOLUME_PATH}/wordpress-db" ]; then \
		sudo mkdir -p ${VOLUME_PATH}/wordpress-db; \
	fi
	@if [ ! -d "${VOLUME_PATH}/mariadb-db" ]; then \
		sudo mkdir -p ${VOLUME_PATH}/mariadb-db; \
	fi
.PHONY: config

up:
	@if [ -z "$$(docker compose -f ${COMPOSE} ps -q 2> /dev/null)" ]; then \
		docker compose -f ${COMPOSE} up; \
	else \
		echo "Containers already up!"; \
	fi
.PHONY: up

down:
	@if [ -n "$$(docker compose -f ${COMPOSE} images -q 2> /dev/null)" ]; then \
		docker compose -f ${COMPOSE} down; \
	else \
		echo "No images to delete!"; \
	fi
.PHONY: down

prune: down
	@if [ -n "$$(docker images -qa)" ]; then \
		docker rmi -f $(shell docker images -qa); \
	fi
	@if [ -n "$$(docker volume ls -q)" ]; then \
		docker volume rm $(shell docker volume ls -q); \
	fi
	@sudo rm -fr ${VOLUME_PATH}/*
.PHONY: prune

rebuild:
	@docker compose -f ${COMPOSE} build --no-cache
.PHONY: rebuild

re: down prune rebuild all
.PHONY: re