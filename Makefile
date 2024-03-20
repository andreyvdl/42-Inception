VOLUME_PATH=/home/adantas-/data

all: permission config up
.PHONY: all

permission:
	@/usr/bin/echo '\033[1;33mGIVE ME YOUR SUDO PERMISSION\033[0m'
	@sudo /usr/bin/echo '\033[1;31mYOU FOOL! I NOW HAVE FULL CONTROL\033[0m'
.PHONY: permission

config:
	@sudo chmod 777 /etc/hosts
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

down:
	ifneq ()

prune:
	@docker system prune -f -a
	@sudo rm -fr ${VOLUME_PATH}

re: prune all
.PHONY: re