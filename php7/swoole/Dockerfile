FROM vkyii/docker.php:7

MAINTAINER vkyii@foxmail.com

ENV SWOOLE_VERSION swoole-1.7.18-stable


WORKDIR /build
COPY . .

RUN apk-install --virtual build-deps openssl-dev build-base autoconf linux-headers \
 && wget https://github.com/swoole/swoole-src/archive/$SWOOLE_VERSION.tar.gz \
 && tar -zxf $SWOOLE_VERSION.tar.gz \
 && cd swoole-src-$SWOOLE_VERSION \
 && mv ../swoole.h.patch . \
 && pwd \
 && patch include/swoole.h < swoole.h.patch \
 && phpize \
 && ./configure \
 && make \
 && make install \
 && make clean \
 && echo "extension=swoole.so" > $PHP_PATH/etc/php.ini \
 && apk del build-deps \
 && cd / \
 && rm -rf /build

EXPOSE 12312
