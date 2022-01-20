FROM composer:2.0

RUN apk add --no-cache git autoconf automake gawk build-base

RUN pecl install mongodb-1.11.1 && docker-php-ext-enable mongodb