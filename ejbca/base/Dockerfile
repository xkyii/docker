#
# TEST 
# 准备好测试用的东西
#


FROM vkyii/jboss:latest

MAINTAINER vkyii@foxmail.com

ENV APPSRV_HOME=$JBOSS_HOME \
	EJBCA_HOME=/build/ejbca_ce_6_3_1_1 \
	ANT_VER=1.9.6 \
	ANT_HOME=/build/apache-ant-1.9.6

WORKDIR /build
COPY . /build

RUN mkdir -p /opt \
 && apk-install supervisor mysql-client mysql \
 && wget http://downloads.sourceforge.net/project/ejbca/ejbca6/ejbca_6_3_1_1/ejbca_ce_6_3_1_1.zip \
 && unzip ejbca_ce_6_3_1_1.zip -q \
 && wget http://archive.apache.org/dist/ant/binaries/apache-ant-$ANT_VER-bin.tar.gz \
 && tar -zxf apache-ant-$ANT_VER-bin.tar.gz \
 && wget http://cdn.mysql.com/Downloads/Connector-J/mysql-connector-java-5.1.36.tar.gz \
 && tar -zxf mysql-connector-java-5.1.36.tar.gz \
 && mv ./mysql-connector-java-5.1.36/mysql-connector-java-5.1.36-bin.jar . \
 && rm -rf mysql-connector-java-5.1.36test


