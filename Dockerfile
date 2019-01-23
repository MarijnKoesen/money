FROM php:7.2-cli

RUN set -xe \
	&& apt-get update \
	&& apt-get install -qqy libicu-dev locales libgmp-dev git unzip libzip-dev \
    && docker-php-ext-install -j$(nproc) intl bcmath gmp zip \
	&& curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer \
	&& composer global require hirak/prestissimo

RUN set -xe \
	&& echo en_US ISO-8859-1 >> /etc/locale.gen \
	&& echo en_US.UTF-8 UTF-8 >> /etc/locale.gen \
	&& echo en_CA ISO-8859-1 >> /etc/locale.gen \
	&& echo en_CA.UTF-8 UTF-8 >> /etc/locale.gen \
	&& echo es_ES ISO-8859-1 >> /etc/locale.gen \
	&& echo es_ES.UTF-8 UTF-8 >> /etc/locale.gen \
	&& echo ru_RU ISO-8859-5 >> /etc/locale.gen \
	&& echo ru_RU.UTF-8 UTF-8 >> /etc/locale.gen \
	&& locale-gen \
    && update-locale

ENTRYPOINT /bin/bash
