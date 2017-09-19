FROM mysql:5.7

RUN echo "Europe/Tallinn" > /etc/timezone \
  && dpkg-reconfigure -f noninteractive tzdata

COPY ./src/docker-entrypoint-initdb.d /docker-entrypoint-initdb.d
COPY ./src/etc/mysql/my.cnf /etc/mysql/my.cnf

RUN chmod 600 /etc/mysql/my.cnf

WORKDIR /usr/local/apache2/htdocs
