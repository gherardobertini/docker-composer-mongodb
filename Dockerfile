FROM php:7.1-apache

RUN apt-get update && apt-get install -y \
    default-mysql-client \
    libssl-dev \
    libzip-dev \
    vim \
    && rm -rf /var/lib/apt \
    && docker-php-ext-install mysqli pdo_mysql zip

# MongoDB #
RUN pecl install mongodb-1.11.1 && docker-php-ext-enable mongodb

# Composer #
# COPY --from=composer /usr/bin/composer /usr/bin/composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# mod_rewrite
RUN a2enmod rewrite

EXPOSE 80 443

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]