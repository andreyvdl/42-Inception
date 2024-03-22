FROM  debian:oldstable

ARG SERVER_NAME
ARG ROOT_USER
ARG ROOT_PW
ARG ROOT_MAIL
ARG WP_USER
ARG WP_MAIL
ARG WP_PW
ARG WP_DB

# WORKDIR /var/www/html/

# install dependencies and maria client
RUN apt update && apt install -y \
	php7.4 \
	php-fpm \
	php-mysql \
	mariadb-client \
	wordpress \
	wget \
	&& \
	apt clean

# download CLI
RUN wget -O /usr/bin/wp \
	https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# change permission and install wordpress files
RUN chmod 777 /usr/bin/wp \
	&& \
	wp core download --allow-root --path=/var/www/html

# IDK, it wasn't creating this folder, chatGPT said to create myself
# and worked
RUN mkdir /run/php

# copy config and script
COPY ./conf/www.conf                       /etc/php/7.4/fpm/pool.d/www.conf
COPY ./conf/wp-config.php                  /var/www/html/wp-config.php
COPY ./tools/init-only-if-mariadb-is-up.sh /tmp/script.sh

# change permission
RUN chmod 777 /tmp/script.sh

ENTRYPOINT [ "bash" ]
CMD [ "/tmp/script.sh" ]
