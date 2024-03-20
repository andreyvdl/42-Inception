FROM debian:oldstable

ARG WP_DB
ARG WP_USER
ARG WP_PW

RUN apt update && apt upgrade -y && \
	apt install -y \
	mariadb-server && \
	rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/mysqld && \
	chown -R mysql:mysql /var/run/mysqld && \
	chmod 777 /var/run/mysqld

COPY ./conf/my.cnf /etc/mysql/my.cnf
COPY ./tools/db-script.sh /tmp/script.sh
RUN chmod +x /tmp/script.sh

RUN bash /tmp/script.sh

CMD ["mysqld_safe"]