FROM debian:oldstable

RUN apt update && apt install -y nginx \
  openssl\
  && apt clean

ENTRYPOINT [ "nginx" ]
CMD [ "-g", "daemon off;" ]

