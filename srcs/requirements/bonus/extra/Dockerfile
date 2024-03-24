FROM debian:oldstable

# install dependencies
RUN bash -c "apt update && apt install -y \
  nginx \
  wget \
  tar \
  curl \
  && \
  apt clean"

# copy config
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

# setup net_practice to nginx
RUN bash -c "wget https://cdn.intra.42.fr/document/document/23673/net_practice.1.5.tgz \
  -P /tmp \
  && \
  tar -xvf /tmp/net_practice.1.5.tgz -C /usr/share/nginx/html \
  && \
  mv /usr/share/nginx/html/net_practice/* /usr/share/nginx/html \
  && \
  rm -fr /tmp/net_practice.1.5.tgz"

# chatGPT... never build your on container, just use FROM node
RUN bash -c "curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash"
RUN bash -c "source /root/.bashrc && nvm install 20"

RUN bash -c "mkdir -p /app"

WORKDIR /app

COPY ./tools/package-lock.json     ./
COPY ./tools/package.json          ./
COPY ./tools/public                ./
COPY ./tools/running-two-daemon.sh ./script.sh

RUN bash -c "chmod 777 script.sh"
  
RUN bash -c "source /root/.bashrc && npm install"


ENTRYPOINT [ "bash" ]
CMD [ "-c", "source /root/.bashrc && bash script.sh" ]
