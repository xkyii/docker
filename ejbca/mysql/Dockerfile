






#
# EJBCA using Mysql
#


FROM vkyii/jboss:latest

MAINTAINER vkyii@foxmail.com

ENV ROOT_PASSWORD=docker \
	USERNAME=ejbca \
	PASSWORD=ejbca \
	APPSRV_HOME=$JBOSS_HOME \
	EJBCA_HOME=/build/ejbca_ce_6_3_1_1 \
	ANT_VER=1.9.6 \
	ANT_HOME=/build/apache-ant-1.9.6

ADD config/mysql/* $APPSRV_HOME/modules/com/mysql/main/
ADD config/ejbca/* $EJBCA_HOME/conf/
ADD script/*.sh /usr/bin/

WORKDIR /build
COPY . /build

RUN mkdir -p $APPSRV_HOME/modules/com/mysql/main/ \
 && apk-install mysql-client mysql \
 && wget http://downloads.sourceforge.net/project/ejbca/ejbca6/ejbca_6_3_1_1/ejbca_ce_6_3_1_1.zip \
 && unzip ejbca_ce_6_3_1_1.zip -q \
 && wget http://archive.apache.org/dist/ant/binaries/apache-ant-$ANT_VER-bin.tar.gz \
 && tar -zxf apache-ant-$ANT_VER-bin.tar.gz \
 && wget http://cdn.mysql.com/Downloads/Connector-J/mysql-connector-java-5.1.36.tar.gz \
 && tar -zxf mysql-connector-java-5.1.36.tar.gz \
 && mv ./mysql-connector-java-5.1.36/mysql-connector-java-5.1.36-bin.jar $APPSRV_HOME/modules/com/mysql/main/ \
 && /bin/sh /usr/bin/build-ejbca.sh \
 && rm -rf /build


CMD ["/bin/sh", "/usr/bin/startup.sh"]