#
# 两件事:
# 1. 开启mysql服务
# 2. 部署ejbca
#

FROM vkyii/ejbca:base

MAINTAINER vkyii@foxmail.com

ENV ROOT_PASSWORD docker

RUN mkdir -p $APPSRV_HOME/modules/com/mysql/main/ \
 && mkdir -p $APPSRV_HOME/modules/org/mariadb/main/ \
 && mv /build/mysql-connector-java-5.1.36-bin.jar $APPSRV_HOME/modules/com/mysql/main/ \
 && mysql_install_db --user=mysql -ldata=/var/lib/mysql

ADD config/mariadb/* $APPSRV_HOME/modules/org/mariadb/main/
ADD config/mysql/* $APPSRV_HOME/modules/com/mysql/main/
ADD config/ejbca/* $EJBCA_HOME/conf/
ADD config/supervisor/supervisord.conf /etc/supervisord.conf

ADD script/mysql_up.sh /usr/bin/
ADD script/build-ejbca.sh /usr/bin/

CMD ["supervisord", "-c", "/etc/supervisord.conf"]

