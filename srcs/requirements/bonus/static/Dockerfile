FROM debian:oldstable

# install nginx
RUN apt update && apt install -y \
  nginx \
  && \
  apt clean

# copy website and config
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./tools           /usr/share/nginx/html

ENTRYPOINT [ "nginx" ]
CMD [ "-g", "daemon off;" ]
