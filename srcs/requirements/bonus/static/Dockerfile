FROM debian:oldstable

# install nginx
RUN apt update && apt install -y nginx \
  openssl \
  && \
  apt clean

# setup ssl
RUN openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:4096 \
  -keyout /etc/ssl/certs/${SERVER_NAME}.key \
  -out /etc/ssl/certs/${SERVER_NAME}.crt \
  -subj "/C=BR/ST=SP/L=Sao Paulo/O=42SP/OU=Student Project/CN=${SERVER_NAME}"

# copy website and config
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./tools           /usr/share/nginx/html

ENTRYPOINT [ "nginx" ]
CMD [ "-g", "daemon off;" ]
