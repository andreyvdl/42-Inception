COMPOSE=./srcs/docker-compose.yaml
VOLUME=/home/login/data

up:
	@sudo mkdir -p ${VOLUME}/mdb
	@sudo mkdir -p ${VOLUME}/wp
	@if [ -z "$$(docker-compose -f ${COMPOSE} ps -q 2> /dev/null)" ]; then \
		docker-compose -f ${COMPOSE} up; \
	else \
		echo "Containers already up!"; \
	fi
.PHONY: up

down:
	@if [ -n "$$(docker-compose -f ${COMPOSE} images -q 2> /dev/null)" ]; then \
		docker-compose -f ${COMPOSE} down; \
	else \
		echo "No images to delete!"; \
	fi
	@if [ -n "$$(docker volume ls -q)" ]; then \
		docker volume rm $(shell docker volume ls -q); \
	fi
.PHONY: down

prune: down
	@docker system prune -f -a
	@sudo rm -fr ${VOLUME}
.PHONY: prune
