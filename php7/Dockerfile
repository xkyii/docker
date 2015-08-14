FROM vkyii/alpine:latest

MAINTAINER vkyii@foxmail.com

ENV PHP_VERSION php-7.0.0beta2
ENV PHP_PATH /usr/local/php7
ENV PATH $PHP_PATH/bin:$PATH


WORKDIR /build

RUN apk-install --virtual build-deps openssl-dev libxml2-dev build-base autoconf bison \
 && wget https://github.com/php/php-src/archive/$PHP_VERSION.tar.gz \
 && tar -zxf $PHP_VERSION.tar.gz \
 && cd php-src-$PHP_VERSION \
 && ./buildconf --force \
 && ./configure \
		CFLAGS="$CFLAGS -Os -fomit-frame-pointer -fvisibility=hidden" \
		--prefix=$PHP_PATH \
		--bindir=$PHP_PATH/bin \
		--sbindir=$PHP_PATH/sbin \
		--includedir=$PHP_PATH/include \
		--libdir=$PHP_PATH/lib/php \
		--mandir=$PHP_PATH/php/man \
		--with-config-file-path=$PHP_PATH/etc \
 && mkdir -p $PHP_PATH/etc \
 && cp php.ini-production $PHP_PATH/etc/php.ini \
 && make \
 && make install \
 && make clean \
 && apk del build-deps \
 && apk-install libxml2 \
 && cd / \
 && rm -rf /build
