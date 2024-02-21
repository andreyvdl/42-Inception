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

CMD [ "nginx", "-g", "daemon off;" ]

