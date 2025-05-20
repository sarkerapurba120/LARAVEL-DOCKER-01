FROM php:8.1.0-apacheclea
WORKDIR /var/www/html

# mod Rewrite
RUN a2enmod rewrite

RUN apt-get update && apt-get install -y libicu-dev unzip zip

# Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
RUN docker-php-ext-install intl pdo_mysql