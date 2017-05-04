FROM php:7.1.4
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    mysql-client-5.5 curl git unzip libpng12-dev libjpeg-dev
RUN docker-php-ext-configure gd --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install gd mbstring opcache pdo pdo_mysql
COPY ./php.ini /usr/local/etc/php/
ENTRYPOINT ["/web/vendor/bin/drupal"]
