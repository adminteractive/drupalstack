FROM php:7.1-fpm

RUN echo "Europe/Tallinn" > /etc/timezone \
  && dpkg-reconfigure -f noninteractive tzdata

RUN apt-get update

RUN apt-get install -y cron

RUN apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng12-dev \
  && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir==/usr/include/ \
  && docker-php-ext-install gd

RUN docker-php-ext-configure exif \
  && docker-php-ext-install exif

RUN apt-get install -y libssl-dev \
  && docker-php-ext-configure ftp \
  && docker-php-ext-install ftp

RUN docker-php-ext-configure bcmath \
  && docker-php-ext-install bcmath

RUN docker-php-ext-configure sockets \
  && docker-php-ext-install sockets

RUN apt-get install -y libxml2-dev \
  && docker-php-ext-configure soap \
  && docker-php-ext-install soap

RUN docker-php-ext-configure calendar \
  && docker-php-ext-install calendar

RUN docker-php-ext-configure mbstring \
  && docker-php-ext-install mbstring

RUN apt-get install -y libpq-dev \
  && docker-php-ext-configure pgsql \
  && docker-php-ext-install pgsql

RUN docker-php-ext-configure mysqli \
  && docker-php-ext-install mysqli

RUN docker-php-ext-configure pdo \
  && docker-php-ext-install pdo pdo_pgsql pdo_mysql

RUN apt-get install -y libcurl4-openssl-dev \
  && docker-php-ext-configure curl \
  && docker-php-ext-install curl

RUN docker-php-ext-configure hash \
  && docker-php-ext-install hash

RUN apt-get install -y libmcrypt-dev \
  && docker-php-ext-configure mcrypt \
  && docker-php-ext-install mcrypt

RUN docker-php-ext-configure iconv \
  && docker-php-ext-install iconv

RUN docker-php-ext-configure openssl; exit 0 \
  && cp /usr/src/php/ext/openssl/config0.m4 /usr/src/php/ext/openssl/config.m4 \
  && docker-php-ext-install openssl

RUN apt-get install -y libbz2-dev \
  && docker-php-ext-configure bz2 \
  && docker-php-ext-install bz2

RUN docker-php-ext-configure zlib; exit 0 \
  && cp /usr/src/php/ext/zlib/config0.m4 /usr/src/php/ext/zlib/config.m4 \
  && docker-php-ext-install zlib

RUN docker-php-ext-configure gettext \
  && docker-php-ext-install gettext

RUN apt-get install -y libpspell-dev \
  && docker-php-ext-configure pspell \
  && docker-php-ext-install pspell

RUN apt-get install -y libldap2-dev \
  && ln -s /usr/lib/x86_64-linux-gnu/libldap.so /usr/lib/libldap.so \
  && docker-php-ext-configure ldap \
  && docker-php-ext-install ldap

RUN apt-get install -y libedit-dev libreadline-dev \
  && docker-php-ext-configure readline \
  && docker-php-ext-install readline

RUN apt-get install -y libc-client-dev libkrb5-dev && rm -r /var/lib/apt/lists/* \
  && docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
  && docker-php-ext-install imap \
  && apt-get update

RUN pecl install xdebug-2.5.5 \
  && docker-php-ext-enable xdebug

RUN apt-get install -y libmemcached-dev zlib1g-dev \
  && pecl install memcached-3.0.3 \
  && docker-php-ext-enable memcached

RUN pecl install redis-3.1.3 \
  && docker-php-ext-enable redis

RUN version=$(php -r "echo PHP_MAJOR_VERSION.PHP_MINOR_VERSION;") \
  && curl -A "Docker" -o /tmp/blackfire-probe.tar.gz -D - -L -s https://blackfire.io/api/v1/releases/probe/php/linux/amd64/$version \
  && tar zxpf /tmp/blackfire-probe.tar.gz -C /tmp \
  && mv /tmp/blackfire-*.so $(php -r "echo ini_get('extension_dir');")/blackfire.so \
  && printf "extension=blackfire.so\nblackfire.agent_socket=tcp://blackfire:8707\n" > $PHP_INI_DIR/conf.d/blackfire.ini

RUN apt-get install -y ssmtp
COPY ./src/etc/ssmtp/ssmtp.conf /etc/ssmtp/ssmtp.conf

RUN apt-get install -y wget \
  && wget http://files.drush.org/drush.phar -O /usr/local/bin/drush \
  && chmod +x /usr/local/bin/drush \
  && echo "y" | drush init

RUN curl https://drupalconsole.com/installer -L -o /usr/local/bin/drupal \
  && chmod +x /usr/local/bin/drupal \
  && echo "1 en /tmp no no yes no no yes" | drupal init

RUN apt-get install -y unzip

RUN docker-php-ext-configure zip \
  && docker-php-ext-install zip

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
  && php -r "if (hash_file('SHA384', 'composer-setup.php') === '669656bab3166a7aff8a7506b8cb2d1c292f042046c5a994c43155c0be6190fa0355160742ab2e1c88d40d5be660b410') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
  && php composer-setup.php \
  && php -r "unlink('composer-setup.php');" \
  && mv composer.phar /usr/local/bin/composer \
  && chmod +x /usr/local/bin/composer

RUN apt-get install -y imagemagick libmagickwand-dev libmagickcore-dev \
  && pecl install imagick-3.4.3 \
  && docker-php-ext-enable imagick

RUN docker-php-ext-install opcache \
  && docker-php-ext-enable opcache

RUN apt-get install -y git

RUN git clone https://github.com/Jan-E/uploadprogress.git /tmp/php-uploadprogress \
	&& cd /tmp/php-uploadprogress \
	&& phpize \
	&& ./configure --prefix=/usr \
	&& make \
	&& make install \
	&& echo 'extension=uploadprogress.so' > $PHP_INI_DIR/conf.d/uploadprogress.ini \
	&& rm -rf /tmp/*

COPY ./src/usr/local/etc/php/php.ini /usr/local/etc/php/php.ini

COPY ./src/etc/cron.d/drupalstack /etc/cron.d/drupalstack

COPY ./src/entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
