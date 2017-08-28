FROM mysql:5.7

RUN echo "Europe/Tallinn" > /etc/timezone \
  && dpkg-reconfigure -f noninteractive tzdata

COPY ./src/docker-entrypoint-initdb.d/init.sql /docker-entrypoint-initdb.d/init.sql

COPY ./src/etc/mysql/conf.d/mysql.cnf /etc/mysql/conf.d/mysql.cnf
