FROM debian:oldstable

# install mariadb
RUN apt update && apt install -y \
  mariadb-server \
  mariadb-client \
  && \
  apt clean

# configure
COPY ./conf/my.cnf        /etc/mysql/my.cnf
COPY ./tools/db-script.sh /tmp/db-script.sh

# start database
RUN service mariadb start \
  && \
  mariadb -u root -e \
  "CREATE DATABASE IF NOT EXISTS ${WP_DB}; \
CREATE USER '${WP_USER}'@'%' IDENTIFIED BY '${WP_PW}'; \
GRANT ALL ON ${WP_DB}.* TO '${WP_USER}'@'%' IDENTIFIED BY '${WP_PW}'; \
FLUSH PRIVILEGES;" \
  && \
  service mariadb stop

# RUN chmod 777 /tmp/db-script.sh && bash /tmp/db-script.sh

ENTRYPOINT [ "mysqld_safe" ]