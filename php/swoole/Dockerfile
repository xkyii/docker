FROM php:7-fpm

MAINTAINER vkyii@foxmail.com

ENV SWOOLE_VERSION swoole-1.7.20-stable

WORKDIR /build

RUN curl -SL https://github.com/swoole/swoole-src/archive/$SWOOLE_VERSION.tar.gz -o swoole.tar.gz \
 && mkdir -p swoole \
 && tar -zxf swoole.tar.gz -C swoole --strip-components=1 \
 && cd swoole \
 && phpize \
 && ./configure \
 && make \
 && make install \
 && echo "extension=swoole.so" > $PHP_INI_DIR/php.ini \
 && echo "\$* ; mkfifo pipe && cat pipe" > /bin/deamon.sh \
 && rm -rf /build

