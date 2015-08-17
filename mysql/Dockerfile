FROM vkyii/alpine:supervisor

RUN apk-install mysql mysql-client
RUN mysql_install_db --user=mysql -ldata=/var/lib/mysql

ADD entrypoint.sh /usr/bin/
EXPOSE 3306

ENTRYPOINT [ "entrypoint.sh" ]