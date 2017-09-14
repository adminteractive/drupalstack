FROM mysql:5.7

RUN echo "Europe/Tallinn" > /etc/timezone \
  && dpkg-reconfigure -f noninteractive tzdata

COPY ./src/docker-entrypoint-initdb.d /docker-entrypoint-initdb.d
COPY ./src/etc/mysql/conf.d/mysql.cnf /etc/mysql/conf.d/mysql.cnf

RUN chmod 600 /etc/mysql/conf.d/mysql.cnf

WORKDIR /usr/local/apache2/htdocs
