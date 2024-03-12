FROM debian:oldstable

# PHP dependencies
RUN apt update && apt install -y \
  wget \
  gnupg2 \
  ca-certificates \
  lsb-release \
  apt-transport-https \
  && apt clean

# Pull PHP package
RUN wget -O /etc/apt/trusted.gpg.d/php.gpg \
  https://packages.sury.org/php/apt.gpg && \
  echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | \
  tee /etc/apt/sources.list.d/php.list

# install PHP
RUN apt update && apt install -y \
  mariadb-client \
  php-fpm \
  php-mysql \
  php-gd \
  php-xml \
  php-mbstring \
  php-curl \
  php-zip \
  && apt clean

RUN mkdir -p /var/www/ && \
  mkdir -p /run/php && chown www-data:www-data /run/php

# Download and install WordPress
RUN wget https://wordpress.org/latest.tar.gz && \
  tar -xzf latest.tar.gz && \
  rm latest.tar.gz && \
  mv wordpress /var/www/html

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

ENTRYPOINT [ "php-fpm8.3" ]
CMD ["-F"]
