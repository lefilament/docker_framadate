FROM php:apache

MAINTAINER maintenance@le-filament.com

RUN apt-get -y update && DEBIAN_FRONTEND=noninteractive apt-get install -y -qq zip unzip git zlib1g-dev libicu-dev g++ mariadb-client git
RUN docker-php-ext-install intl && docker-php-ext-install pdo_mysql

RUN a2enmod rewrite

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

COPY php.ini /usr/local/etc/php/php.ini
COPY apache-framadate.conf /etc/apache2/sites-enabled/framadate.conf
COPY entrypoint.sh /usr/local/bin/entrypoint

ENV COMPOSER_ALLOW_SUPERUSER=1
RUN set -eux; \
    composer global require "hirak/prestissimo:^0.3" --prefer-dist --no-progress --no-suggest --classmap-authoritative; \
    composer clear-cache
ENV PATH="${PATH}:/root/.composer/vendor/bin"
ENV COMPOSER_ALLOW_SUPERUSER 0

RUN git clone https://framagit.org/framasoft/framadate/framadate.git /var/www/framadate
WORKDIR /var/www/framadate

RUN rm /etc/apache2/sites-enabled/000-default.conf
EXPOSE 80
ENTRYPOINT ["entrypoint"]
