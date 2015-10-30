FROM centos:6.6

MAINTAINER vkyii@foxmail.com


WORKDIR /build

RUN yum -y install gcc gcc-c++ wget tar zlib-devel bzip2 \
 #	upgrade gcc/g++
 && curl -O http://ftp.tsukuba.wide.ad.jp/software/gcc/releases/gcc-5.2.0/gcc-5.2.0.tar.gz \
 && tar -zxf gcc-5.2.0.tar.gz \
 && cd gcc-5.2.0/contrib \
 && bash download_prerequisites \
 && mv gmp-4.3.2  ../gmp \
 && mv mpfr-2.4.2  ../mpfr \
 && mv mpc-0.8.1 ../mpc \
 && cd /build \
 && mkdir gcc-build-5.2.0 \
 && cd gcc-build-5.2.0 \
 && ../gcc-5.2.0/configure \
 	--enable-checking=release \
 	--disable-multilib \
 	--enable-languages=c,c++ \
 && make -j4 \
 && make install \
 && mv /usr/bin/gcc /usr/bin/gcc4 \
 && ln -s /usr/local/bin/gcc /usr/bin/gcc
 && mv /usr/bin/g++ /usr/bin/g++4 \
 && ln -s /usr/local/bin/++ /usr/bin/++
 && mv /usr/bin/c++ /usr/bin/c++4 \
 && ln -s /usr/local/bin/++ /usr/bin/++
 #	clear
