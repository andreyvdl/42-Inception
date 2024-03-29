#! /bin/bash

rm -fr /var/www/html/wp-config-sample.php \
  && \
  wp core install --allow-root \
  --path=/var/www/html \
  --title="42Project InceptionHELL" \
  --url=${SERVER_NAME} \
  --admin_user=${ROOT_USER} \
  --admin_password=${ROOT_PW} \
  --admin_email=${ROOT_MAIL} \
  && \
  wp user create --allow-root \
  --path=/var/www/html \
  "${WP_USER}" "${WP_MAIL}" \
  --user_pass=${WP_PW} \
  --role="author"

/usr/bin/php-fpm -F