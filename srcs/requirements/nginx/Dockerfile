FROM debian:oldstable

ARG SERVER_NAME

RUN apt update &&  apt upgrade -y && \
	apt install -y \
	nginx \
	openssl && \
	rm -rf /var/lib/apt/lists/*

RUN openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:4096 \
  -keyout /etc/ssl/certs/${SERVER_NAME}.key \
  -out /etc/ssl/certs/${SERVER_NAME}.crt \
  -subj "/C=BR/ST=SP/L=Sao Paulo/O=42SP/OU=Student Project/CN=${SERVER_NAME}"

COPY ./conf/nginx.conf /etc/nginx/conf.d
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

EXPOSE 443

ENTRYPOINT [ "nginx" ]
CMD [ "-g", "daemon off;" ]