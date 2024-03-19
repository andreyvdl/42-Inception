FROM debian:oldstable

ARG SERVER_NAME

# install nginx and ssl
RUN apt update && apt install -y nginx \
  openssl\
  && \
  apt clean

# configure ssl
RUN openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:4096 \
  -keyout /etc/ssl/certs/${SERVER_NAME}.key \
  -out /etc/ssl/certs/${SERVER_NAME}.crt \
  -subj "/C=BR/ST=SP/L=Sao Paulo/O=42SP/OU=Student Project/CN=${SERVER_NAME}"

# copy config
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
# COPY ./default    /etc/nginx/sites-available/default

ENTRYPOINT [ "nginx" ]
CMD [ "-g", "daemon off;" ]
