FROM debian:oldstable

RUN apt update && apt install -y php\
  wordpress\
  wget\
  vim\
  nano\
  && apt clean

RUN wget "https://raw.githubusercontent.com/"\
"wp-cli/builds/gh-pages/phar/wp-cli.phar"
