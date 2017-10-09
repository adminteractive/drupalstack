FROM mysql:5.7

RUN echo "Europe/Tallinn" > /etc/timezone \
  && dpkg-reconfigure -f noninteractive tzdata

RUN apt-get update \
  && apt-get install -y \
     nano \
  && rm -rf /var/lib/apt/lists/*

COPY ./src/docker-entrypoint-initdb.d /docker-entrypoint-initdb.d
COPY ./src/etc/mysql/my.cnf /etc/mysql/my.cnf
COPY ./src/etc/bash.bashrc /etc/bash.bashrc

RUN chmod 644 /etc/mysql/my.cnf

WORKDIR /usr/local/apache2/htdocs
