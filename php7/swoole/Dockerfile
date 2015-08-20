FROM vkyii/php:7

MAINTAINER vkyii@foxmail.com

#ENV SWOOLE_VERSION swoole-1.7.18-stable
ENV SWOOLE_VERSION swoole-1.7.19-rc1

WORKDIR /build

RUN curl -SL https://github.com/swoole/swoole-src/archive/$SWOOLE_VERSION.tar.gz -o swoole.tar.gz \
 && mkdir -p swoole \
 && tar -zxf swoole.tar.gz -C swoole --strip-components=1 \
 && cd swoole \
 && phpize \
 && ./configure \
 && make \
 && make install \
 && echo "extension=swoole.so" > $PHP_INI_DIR/php.ini


