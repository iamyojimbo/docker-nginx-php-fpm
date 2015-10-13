FROM php:fpm
MAINTAINER Savvas Nicholas <iamyojimbo@gmail.com>

RUN apt-get update
RUN apt-get install -y --force-yes \
	libssl-dev \
	libmcrypt-dev

#RUN docker-php-ext-install mcrypt opcache

#RUN pecl install mongo

ADD php-fpm.conf /usr/local/etc/php-fpm.conf