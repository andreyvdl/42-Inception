FROM debian:oldstable

# install dependencies
RUN apt update && apt install -y \
  nginx \
  wget \
  tar \
  && \
  apt clean

# copy config
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

# setup net_practice to nginx
RUN wget https://cdn.intra.42.fr/document/document/23673/net_practice.1.5.tgz \
  -P /tmp \
  && \
  tar -xvf /tmp/net_practice.1.5.tgz -C /usr/share/nginx/html \
  && \
  mv /usr/share/nginx/html/net_practice/* /usr/share/nginx/html \
  && \
  rm -fr /tmp/net_practice.1.5.tgz

ENTRYPOINT [ "nginx" ]
CMD [ "-g", "daemon off;" ]
