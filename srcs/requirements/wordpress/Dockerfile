FROM  debian:oldstable

ARG SERVER_NAME
ARG ROOT_USER
ARG ROOT_PW
ARG ROOT_MAIL
ARG WP_USER
ARG WP_MAIL
ARG WP_PW

# PHP and WP dependencies
RUN apt update && apt install -y \
  wget \
  gnupg2 \
  ca-certificates \
  lsb-release \
  apt-transport-https \
  mariadb-client \
  && \
  apt clean

# Pull PHP package
RUN wget -O /etc/apt/trusted.gpg.d/php.gpg \
  https://packages.sury.org/php/apt.gpg \
  && \
  echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" \
  | \
  tee /etc/apt/sources.list.d/php.list

# install PHP
RUN apt update && apt install -y \
  php-fpm \
  php-mysql \
  php-gd \
  php-xml \
  php-mbstring \
  php-curl \
  php-zip \
  && \
  apt clean

# configure enviroment
RUN mkdir -p /var/www/ \
  && \
  mkdir -p /run/php \
  && \
  chown www-data:www-data /run/php \
  && \
  ln -s $(whereis php-fpm | awk '{print $2}') /usr/bin/php-fpm

# Download and install WordPress
RUN wget https://wordpress.org/latest.tar.gz \
  && \
  tar -xzf latest.tar.gz \
  && \
  rm latest.tar.gz \
  && \
  mv wordpress /var/www/html

# configure wordpress
COPY ./conf/wp-config.php /var/www/html/wp-config.php
COPY ./conf/www.conf      /etc/php/*/fpm/pool.d/www.conf

# download wordpress-cli
RUN wget -O /usr/bin/wp \
  https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && \
  chmod +x /usr/bin/wp

# configure wordpress via cli instead of browser
# RUN rm -fr /var/www/html/wp-config-sample.php \
#   && \
#   wp core install --allow-root \
#   --path=/var/www/html \
#   --title="42Project InceptionHELL" \
#   --url=${SERVER_NAME} \
#   --admin_user=${ROOT_USER} \
#   --admin_password=${ROOT_PW} \
#   --admin_email=${ROOT_MAIL} \
#   && \
#   wp user create --allow-root \
#   --path=/var/www/html \
#   "${WP_USER}" "${WP_MAIL}" \
#   --user_pass=${WP_PW} \
#   --role="author"

COPY ./tools/init-only-if-mariadb-is-up.sh /tmp/script.sh

ENTRYPOINT [ "bash" ]
CMD [ "/tmp/script.sh" ]
