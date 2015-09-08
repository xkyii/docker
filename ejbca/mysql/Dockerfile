
#
# EJBCA using Mysql
#

FROM vkyii/jboss:latest

MAINTAINER twist@vkyii.com

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


RUN apk-install mysql-client mysql \
 && wget http://downloads.sourceforge.net/project/ejbca/ejbca6/ejbca_6_3_1_1/ejbca_ce_6_3_1_1.zip \
 && unzip ejbca_ce_6_3_1_1.zip -q \
 && wget http://archive.apache.org/dist/ant/binaries/apache-ant-$ANT_VER-bin.tar.gz \
 && tar -zxf apache-ant-$ANT_VER-bin.tar.gz \
 && wget http://cdn.mysql.com/Downloads/Connector-J/mysql-connector-java-5.1.36.tar.gz \
 && tar -zxf mysql-connector-java-5.1.36.tar.gz \
 && mkdir -p $APPSRV_HOME/modules/com/mysql/main/ \
 && mv ./mysql-connector-java-5.1.36/mysql-connector-java-5.1.36-bin.jar $APPSRV_HOME/modules/com/mysql/main/ \
 && /bin/sh /usr/bin/build-ejbca.sh \
 && rm -rf /build


RUN apk-install --virtual build-deps openssl  \
 && cd /p12 \
 #	transport server keystore from JKS to pkcs12
 && keytool -importkeystore -srckeystore tomcat.jks -srcstoretype jks \
 	-destkeystore tomcat.p12 -deststoretype pkcs12 -srcalias localhost \
 	-srcstorepass serverpwd -deststorepass serverpwd -destkeypass serverpwd \
 #	export truststore
 && keytool -exportcert -rfc -keystore truststore.jks  -storepass changeit -storetype JKS -alias managementca -file ca.crt \
 #	change cert & key format
 && openssl pkcs12 -in superadmin.p12 -passin pass:ejbca -nokeys -out superadmin.crt \
 && openssl pkcs12 -in superadmin.p12 -passin pass:ejbca -nocerts -out superadmin.key -passout pass:ejbca \
 && openssl pkcs12 -in tomcat.p12 -passin pass:serverpwd -nokeys -out tomcat.crt \
 && openssl pkcs12 -in tomcat.p12 -passin pass:serverpwd -nocerts -out tomcat.key -passout pass:serverpwd \
 #	clear
 && apk del build-deps


CMD ["/bin/sh", "/usr/bin/startup.sh"]