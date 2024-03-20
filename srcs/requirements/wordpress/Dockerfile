FROM  debian:oldstable

ARG SERVER_NAME
ARG ROOT_USER
ARG ROOT_PW
ARG ROOT_MAIL
ARG WP_USER
ARG WP_MAIL
ARG WP_PW
ARG WP_DB

WORKDIR /var/www/html/

RUN apt update && apt upgrade -y && \
	apt install -y \
	php7.4 \
	php-fpm \
	php-mysql \
	mariadb-client \
	wordpress \
	wget && \
	rm -rf /var/lib/apt/lists/*

RUN wget -O /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x /usr/local/bin/wp
RUN wp core download --allow-root --path=/var/www/html

RUN mkdir /run/php

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY conf/wp-config.php /var/www/html/wp-config.php
COPY ./tools/init-only-if-mariadb-is-up.sh /tmp/script.sh

RUN chmod +x /tmp/script.sh

# ENTRYPOINT ["bash"]
ENTRYPOINT [ "/tmp/script.sh"]
