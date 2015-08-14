FROM vkyii/jboss:latest

MAINTAINER vkyii@foxmail.com

ENV APPSRV_HOME=$JBOSS_HOME \
	EJBCA_HOME=/build/ejbca_ce_6_3_1_1 \
	ANT_VER=1.9.6 \
	ANT_HOME=/build/apache-ant-1.9.6

WORKDIR /build
COPY . /build

RUN mkdir -p /opt \
 && wget http://downloads.sourceforge.net/project/ejbca/ejbca6/ejbca_6_3_1_1/ejbca_ce_6_3_1_1.zip \
 && unzip ejbca_ce_6_3_1_1.zip -q \
 && wget http://archive.apache.org/dist/ant/binaries/apache-ant-$ANT_VER-bin.tar.gz \
 && tar -zxf apache-ant-$ANT_VER-bin.tar.gz \
 && /bin/sh ./build-ejbca.sh \
 && rm -rf /build


CMD ["/opt/jboss-as-7.1.1.Final/bin/standalone.sh", "-b", "0.0.0.0"]
