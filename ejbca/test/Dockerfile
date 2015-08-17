#
# 两件事:
# 1. 开启mysql服务
# 2. 部署ejbca
#

FROM vkyii/ejbca:base

MAINTAINER vkyii@foxmail.com

ADD config/ejbca.properties/* $EJBCA_HOME/conf/
ADD config/supervisor/supervisord.conf /etc/supervisord.conf
ADD config/mysql/mysql_up.sh /usr/bin/

