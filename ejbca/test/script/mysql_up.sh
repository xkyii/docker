#!/bin/sh

INITFILE=/tmp/init.sql
touch $INITFILE


echo "create database ejbca;" >> $INITFILE

if [ -n $ROOT_PASSWORD ]; then
  echo "GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$ROOT_PASSWORD'" >> $INITFILE
fi

if [ -n "$USERNAME" ]; then
  echo "GRANT ALL ON *.* TO '$USERNAME'@'%' IDENTIFIED BY '$PASSWORD'" >> $INITFILE
fi

mysqld_safe --init-file=$INITFILE

# init ejbca db
# cat > /tmp/ejbca.sql <<EOF
# create database ejbca;
# grant all privileges on ejbca.* to 'ejbca'@'localhost' identified by 'ejbca';
# flush privileges;
# EOF

# mysql -u root -e "/tmp/ejbca.sql"