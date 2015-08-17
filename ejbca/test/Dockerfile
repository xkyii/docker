#
# 两件事:
# 1. 开启mysql服务
# 2. 部署ejbca
#

FROM vkyii/ejbca:base

MAINTAINER vkyii@foxmail.com

ENV ROOT_PASSWORD docker

RUN mkdir -p $APPSRV_HOME/modules/com/mysql/main/ \
 && mv /build/mysql-connector-java-5.1.36-bin.jar $APPSRV_HOME/modules/com/mysql/main/ \
 && mysql_install_db --user=mysql -ldata=/var/lib/mysql

ADD config/ejbca/* $EJBCA_HOME/conf/
ADD config/supervisor/supervisord.conf /etc/supervisord.conf
ADD config/mysql/mysql_up.sh /usr/bin/
ADD config/jboss/module.xml $APPSRV_HOME/modules/com/mysql/main/
ADD script/build-ejbca.sh /usr/bin/

CMD ["supervisord", "-c", "/etc/supervisord.conf"]

