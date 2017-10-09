FROM httpd:2.4

RUN echo "Europe/Tallinn" > /etc/timezone \
  && dpkg-reconfigure -f noninteractive tzdata

RUN apt-get update \
  && apt-get install -y \
     nano \
     openssl \
  && rm -rf /var/lib/apt/lists/*

RUN openssl req -x509 -sha256 -nodes -newkey rsa:2048 -days 365 -keyout /usr/local/apache2/conf/server.key -out /usr/local/apache2/conf/server.crt -subj "/C=/ST=/L=/O=/OU=/CN=drupalstack"

COPY ./src/usr/local/apache2/conf/extra/httpd-php.conf /usr/local/apache2/conf/extra/httpd-php.conf
COPY ./src/usr/local/apache2/conf/httpd.conf /usr/local/apache2/conf/httpd.conf
COPY ./src/usr/local/apache2/conf/extra/httpd-ssl.conf /usr/local/apache2/conf/extra/httpd-ssl.conf
COPY ./src/usr/local/apache2/conf/extra/httpd-default.conf /usr/local/apache2/conf/extra/httpd-default.conf
COPY ./src/etc/bash.bashrc /etc/bash.bashrc

WORKDIR /usr/local/apache2/htdocs
