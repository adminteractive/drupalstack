FROM php:7.1.4-apache
RUN a2enmod rewrite
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    curl wget git unzip ssmtp libpng12-dev libjpeg-dev
RUN docker-php-ext-configure gd --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install gd mbstring opcache pdo pdo_mysql
RUN yes | pecl install xdebug \
    && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_autostart=off" >> /usr/local/etc/php/conf.d/xdebug.ini
RUN cd /tmp && wget -O - https://download.newrelic.com/548C16BF.gpg | apt-key add -
RUN sh -c 'echo "deb http://apt.newrelic.com/debian/ newrelic non-free" > /etc/apt/sources.list.d/newrelic.list'
RUN apt-get update && apt-get install -y newrelic-php5
RUN newrelic-install install
RUN echo newrelic.appname = $NR_APP_NAME >> /usr/local/etc/php/conf.d/newrelic.ini
RUN echo newrelic.licence = $NR_INSTALL_KEY >> /usr/local/etc/php/conf.d/newrelic.ini
RUN mkdir -p /web/docroot
COPY ./composer.json /web/
COPY ./php.ini /usr/local/etc/php/
COPY ./ssmtp.conf /etc/ssmtp/
COPY ./virtualhost.conf /etc/apache2/sites-available/000-default.conf
RUN chown -R www-data:www-data /web/docroot
