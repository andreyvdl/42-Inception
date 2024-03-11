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
  php7.4-fpm \
  php7.4-mysql \
  php7.4-gd \
  php7.4-xml \
  php7.4-mbstring \
  php7.4-curl \
  php7.4-zip \
  && apt clean

RUN mkdir -p /var/www/ && \
  mkdir -p /run/php && chown www-data:www-data /run/php

# Download and install WordPress
RUN wget https://wordpress.org/latest.tar.gz && \
  tar -xzf latest.tar.gz && \
  rm latest.tar.gz && \
  mv wordpress /var/www/html

RUN chown -R www-data:www-data /var/www/html \
  && chmod -R 755 /var/www/html

EXPOSE 9000
ENTRYPOINT [ "php-fpm7.4" ]
CMD ["-F"]
