FROM debian:oldstable

RUN apt update && apt install -y \
  nginx \
  wget \
  tar \
  && \
  apt clean

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

RUN wget https://cdn.intra.42.fr/document/document/23673/net_practice.1.5.tgz -P /tmp
RUN tar -xvf /tmp/net_practice.1.5.tgz -C /usr/share/nginx/html
RUN mv /usr/share/nginx/html/net_practice/* /usr/share/nginx/html
RUN rm -fr /tmp/net_practice.1.5.tgz

ENTRYPOINT [ "nginx" ]
CMD [ "-g", "daemon off;" ]
