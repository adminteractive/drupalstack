FROM php:7.1.4-apache
RUN apt-get update && apt-get install -y && apt-get install -y libpng12-dev libjpeg-dev
RUN a2enmod rewrite
RUN docker-php-ext-configure gd --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install -j$(nproc) gd mbstring opcache pdo pdo_mysql
COPY ./php.ini /usr/local/etc/php/
WORKDIR /web
