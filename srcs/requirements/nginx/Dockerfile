FROM debian:oldstable

RUN apt update && apt install -y nginx \
  openssl\
  && apt clean

RUN openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:4096 \
  -keyout /etc/ssl/certs/adantas-.42.fr.key \
  -out /etc/ssl/certs/adantas-.42.fr.crt \
  -subj "/C=BR/ST=SP/L=Sao Paulo/O=42SP/OU=Student Project/CN=adantas-.42.fr"

COPY ./nginx.conf /etc/nginx/nginx.conf

ENTRYPOINT [ "nginx" ]
CMD [ "-g", "daemon off;" ]

