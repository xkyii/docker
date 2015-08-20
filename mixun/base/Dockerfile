FROM vkyii/openjdk7

MAINTAINER vkyii@foxmail.com

ENV CATALINA_HOME /usr/local/tomcat
ENV LD_LIBRARY_PATH $CATALINA_HOME/lib:$LD_LIBRARY_PATH

WORKDIR /build

RUN apk-install openssl apr
RUN apk-install --virtual build-deps openssl-dev build-base autoconf apr-dev \
 && wget http://mirrors.cnnic.cn/apache/tomcat/tomcat-connectors/native/1.1.33/source/tomcat-native-1.1.33-src.tar.gz \
 && tar -zxf tomcat-native-1.1.33-src.tar.gz \
 && cd tomcat-native-1.1.33-src/jni/native \
 && ./configure \
		--with-apr=/usr/bin/apr-1-config \
		--with-java-home=$JAVA_HOME \
		--with-ssl=yes \
		--prefix=$CATALINA_HOME \
 && make \
 && make install \
 && cd / \
 && apk del build-deps \
 && rm -rf /build

EXPOSE 80