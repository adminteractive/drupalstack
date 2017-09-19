FROM php:7.1-fpm

RUN echo "Europe/Tallinn" > /etc/timezone \
  && dpkg-reconfigure -f noninteractive tzdata

RUN apt-get update \
  && apt-get install -y \
     cron \
     libfreetype6-dev \
     libjpeg62-turbo-dev \
     libpng12-dev \
     libssl-dev \
     libxml2-dev \
     libpq-dev \
     libcurl4-openssl-dev \
     libmcrypt-dev \
     libbz2-dev \
     libpspell-dev \
     libldap2-dev \
     libedit-dev \
     libreadline-dev \
     libc-client-dev \
     libkrb5-dev \
     libmemcached-dev \
     zlib1g-dev \
     ssmtp \
     mysql-client \
     wget \
     unzip \
     imagemagick \
     libmagickwand-dev \
     libmagickcore-dev \
     git \
  && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir==/usr/include/ \
  && docker-php-ext-install gd

RUN docker-php-ext-configure exif \
  && docker-php-ext-install exif

RUN docker-php-ext-configure ftp \
  && docker-php-ext-install ftp

RUN docker-php-ext-configure bcmath \
  && docker-php-ext-install bcmath

RUN docker-php-ext-configure sockets \
  && docker-php-ext-install sockets

RUN docker-php-ext-configure soap \
  && docker-php-ext-install soap

RUN docker-php-ext-configure calendar \
  && docker-php-ext-install calendar

RUN docker-php-ext-configure mbstring \
  && docker-php-ext-install mbstring

RUN docker-php-ext-configure pgsql \
  && docker-php-ext-install pgsql

RUN docker-php-ext-configure mysqli \
  && docker-php-ext-install mysqli

RUN docker-php-ext-configure pdo \
  && docker-php-ext-install pdo pdo_pgsql pdo_mysql

RUN docker-php-ext-configure curl \
  && docker-php-ext-install curl

RUN docker-php-ext-configure hash \
  && docker-php-ext-install hash

RUN docker-php-ext-configure mcrypt \
  && docker-php-ext-install mcrypt

RUN docker-php-ext-configure iconv \
  && docker-php-ext-install iconv

RUN docker-php-ext-configure bz2 \
  && docker-php-ext-install bz2

RUN docker-php-ext-configure gettext \
  && docker-php-ext-install gettext

RUN docker-php-ext-configure pspell \
  && docker-php-ext-install pspell

RUN docker-php-ext-configure readline \
  && docker-php-ext-install readline

RUN docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
  && docker-php-ext-install imap

RUN docker-php-ext-configure zip \
  && docker-php-ext-install zip

RUN docker-php-ext-install opcache \
  && docker-php-ext-enable opcache

RUN docker-php-ext-configure openssl; exit 0 \
  && cp /usr/src/php/ext/openssl/config0.m4 /usr/src/php/ext/openssl/config.m4 \
  && docker-php-ext-install openssl

RUN docker-php-ext-configure zlib; exit 0 \
  && cp /usr/src/php/ext/zlib/config0.m4 /usr/src/php/ext/zlib/config.m4 \
  && docker-php-ext-install zlib

RUN ln -s /usr/lib/x86_64-linux-gnu/libldap.so /usr/lib/libldap.so \
  && docker-php-ext-configure ldap \
  && docker-php-ext-install ldap

RUN pecl install xdebug-2.5.5 \
  && docker-php-ext-enable xdebug

RUN pecl install memcached-3.0.3 \
  && docker-php-ext-enable memcached

RUN pecl install redis-3.1.3 \
  && docker-php-ext-enable redis

RUN pecl install imagick-3.4.3 \
  && docker-php-ext-enable imagick

RUN version=$(php -r "echo PHP_MAJOR_VERSION.PHP_MINOR_VERSION;") \
  && curl -A "Docker" -o /tmp/blackfire-probe.tar.gz -D - -L -s https://blackfire.io/api/v1/releases/probe/php/linux/amd64/$version \
  && tar zxpf /tmp/blackfire-probe.tar.gz -C /tmp \
  && mv /tmp/blackfire-*.so $(php -r "echo ini_get('extension_dir');")/blackfire.so \
  && printf "extension=blackfire.so\nblackfire.agent_socket=tcp://blackfire:8707\n" > $PHP_INI_DIR/conf.d/blackfire.ini

RUN git clone https://github.com/Jan-E/uploadprogress.git /tmp/php-uploadprogress \
	&& cd /tmp/php-uploadprogress \
	&& phpize \
	&& ./configure --prefix=/usr \
	&& make \
	&& make install \
	&& echo 'extension=uploadprogress.so' > $PHP_INI_DIR/conf.d/uploadprogress.ini \
	&& rm -rf /tmp/*

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
  && php composer-setup.php \
  && php -r "unlink('composer-setup.php');" \
  && mv composer.phar /usr/local/bin/composer \
  && chmod +x /usr/local/bin/composer

RUN wget http://files.drush.org/drush.phar -O /usr/local/bin/drush \
  && chmod +x /usr/local/bin/drush \
  && echo "y" | drush init

RUN curl https://drupalconsole.com/installer -L -o /usr/local/bin/drupal \
  && chmod +x /usr/local/bin/drupal \
  && echo "1 en /tmp no no yes no no yes" | drupal init

COPY ./src/entrypoint.sh /
COPY ./src/etc/mysql/my.cnf /etc/mysql/my.cnf

RUN chmod 600 /etc/mysql/my.cnf

COPY ./src/etc/ssmtp/ssmtp.conf /etc/ssmtp/ssmtp.conf
COPY ./src/etc/cron.d/drupalstack /etc/cron.d/drupalstack
COPY ./src/usr/local/etc/php/php.ini /usr/local/etc/php/php.ini

WORKDIR /usr/local/apache2/htdocs

ENTRYPOINT ["/entrypoint.sh"]
