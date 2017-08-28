FROM httpd:2.4

RUN echo "Europe/Tallinn" > /etc/timezone \
  && dpkg-reconfigure -f noninteractive tzdata

COPY ./src/usr/local/apache2/conf/extra/httpd-php.conf /usr/local/apache2/conf/extra/httpd-php.conf

COPY ./src/usr/local/apache2/conf/httpd.conf /usr/local/apache2/conf/httpd.conf
