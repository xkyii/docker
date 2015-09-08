
#
# EJBCA using Mysql
#

FROM vkyii/ejbca:latest

MAINTAINER twist@vkyii.com

RUN apk-install --virtual build-deps openssl  \
 && cd /p12 \
 #	transport server keystore from JKS to pkcs12
 && keytool -importkeystore -srckeystore tomcat.jks -srcstoretype jks \
 	-destkeystore tomcat.p12 -deststoretype pkcs12 -srcalias localhost \
 	-srcstorepass serverpwd -deststorepass serverpwd -destkeypass serverpwd \
 #	export truststore
 && keytool -exportcert -rfc -keystore truststore.jks  -storepass changeit -storetype JKS -alias managementca -file ca.crt \
 && openssl pkcs12 -in superadmin.p12 -nokeys -out superadmin.crt \
 && openssl pkcs12 -in superadmin.p12 -nocerts -out superadmin.key \
 && openssl pkcs12 -in tomcat.p12 -nocerts -out tomcat.key \
 && openssl pkcs12 -in tomcat.p12 -nokeys -out tomcat.crt \
 #	clear
 && apk del build-deps