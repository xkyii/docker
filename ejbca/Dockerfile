
#
# EJBCA final base on Mysql
#

FROM vkyii/ejbca:mysql

MAINTAINER twist@vkyii.com


# 数据卷由host -v 指定
ENV DATA_VOLUME=/data


RUN mkdir -p $DATA_VOLUME/p12 \
 && cp /p12/* $DATA_VOLUME/p12