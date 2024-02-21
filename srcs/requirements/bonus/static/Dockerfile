FROM debian:oldstable

RUN apt update

#NGINX DEPENDENCIES
RUN apt install -y curl gnupg2 ca-certificates lsb-release\
  debian-archive-keyring
RUN apt install -y nginx

# #I NEED A EDITOR
# RUN apt install -y vim nano

# #WHY I DONT HAVE PS AS DEFAULT COMMAND?
# RUN apt install -y procps

COPY ./src/nginx.conf /etc/nginx/nginx.conf
COPY ./src/index.html /usr/share/nginx/html/index.html
COPY ./src/style.css  /usr/share/nginx/html/style.css
COPY ./src/chipi.gif  /usr/share/nginx/html/chipi.gif

CMD [ "nginx", "-g", "daemon off;" ]
