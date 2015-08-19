#
# 两件事:
# 1. 开启mysql服务
# 2. 部署ejbca
#

FROM vkyii/ejbca:base

MAINTAINER vkyii@foxmail.com

ENV ROOT_PASSWORD=docker \
	USERNAME=ejbca \
	PASSWORD=ejbca

RUN mkdir -p $APPSRV_HOME/modules/com/mysql/main/ \
 && mv /build/mysql-connector-java-5.1.36-bin.jar $APPSRV_HOME/modules/com/mysql/main/ 

ADD config/mysql/* $APPSRV_HOME/modules/com/mysql/main/
ADD config/ejbca/* $EJBCA_HOME/conf/
ADD config/supervisor/supervisord.conf /etc/supervisord.conf

ADD script/*.sh /usr/bin/

#CMD ["supervisord", "-c", "/etc/supervisord.conf"]
CMD ["/bin/build-ejbca.sh"]

