FROM php:7

MAINTAINER vkyii@foxmail.com

#ENV SWOOLE_VERSION swoole-1.7.18-stable
ENV SWOOLE_VERSION swoole-1.7.19-rc1

WORKDIR /build

RUN wget https://github.com/swoole/swoole-src/archive/$SWOOLE_VERSION.tar.gz -O swoole.tar.gz \
 && tar -zxf swoole.tar.gz -C swoole  \
 && cd swoole \
 && phpize \
 && ./configure \
 && make \
 && make install

