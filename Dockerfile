FROM php:7.4-apache

MAINTAINER niklas.mahler@gmail.com <niklas.mahler@gmail.com>

RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"

# PHP extensions
RUN docker-php-ext-install mysqli && a2enmod rewrite

# Virtual host configuration
ADD config/apache-geniesys.conf /etc/apache2/sites-available/geniesys.conf
RUN ln -sr /etc/apache2/sites-available/geniesys.conf /etc/apache2/sites-enabled
RUN rm /etc/apache2/sites-enabled/000-default.conf
