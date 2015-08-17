FROM vkyii/alpine:supervisor

#RUN apk-install mysql mysql-client
RUN apk --update add mysql mysql-client && rm -rf /var/cache/apk/*
RUN mysql_install_db --user=mysql -ldata=/var/lib/mysql

WORKDIR /mysql

COPY . /mysql
EXPOSE 3306

CMD ["supervisord", "-c", "/mysql/supervisord.conf"]