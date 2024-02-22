FROM debian:oldstable

RUN apt update && apt install -y nginx \
  && apt clean
COPY ./src/nginx.conf /etc/nginx/nginx.conf
COPY ./src/index.html /usr/share/nginx/html/index.html
COPY ./src/style.css  /usr/share/nginx/html/style.css
COPY ./src/chipi.gif  /usr/share/nginx/html/chipi.gif

ENTRYPOINT [ "nginx" ]
CMD [ "-g", "daemon off;" ]
