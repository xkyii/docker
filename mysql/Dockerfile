FROM vkyii/alpine:supervisor

RUN apk-install mysql mysql-client
RUN mysql_install_db --user=mysql -ldata=/var/lib/mysql

WORKDIR /mysql

ADD mysql_up.sh /usr/bin/
ADD supervisord.conf /etc/supervisord.conf
EXPOSE 3306

CMD ["supervisord"]