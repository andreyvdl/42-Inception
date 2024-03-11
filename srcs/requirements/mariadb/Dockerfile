FROM debian:oldstable

RUN groupadd -r mariadb && useradd -r -g mariadb mariadb

RUN apt update && apt install -y \
  mariadb-server \
  mariadb-client \
  && apt clean

ENTRYPOINT [ "service" ]
CMD [ "mariadb", "start" ]
