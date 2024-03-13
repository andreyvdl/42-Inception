FROM debian:oldstable


RUN apt update && apt install -y \
  mariadb-server \
  mariadb-client \
  && apt clean

RUN service mariadb start
CMD [ "mysqld_safe" ]