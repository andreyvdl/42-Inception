FROM debian:oldstable

RUN apt update && apt install -y nginx \
  && apt clean
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./index.html /usr/share/nginx/html/index.html
COPY ./style.css  /usr/share/nginx/html/style.css
COPY ./chipi.gif  /usr/share/nginx/html/chipi.gif

ENTRYPOINT [ "nginx" ]
CMD [ "-g", "daemon off;" ]
