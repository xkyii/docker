#!/bin/sh

INITFILE=/tmp/init.sql
touch $INITFILE


if [ -n $ROOT_PASSWORD ]; then
  echo "GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$ROOT_PASSWORD'" >> $INITFILE
fi

if [ -n "$USERNAME" ]; then
  echo "GRANT ALL ON *.* TO '$USERNAME'@'%' IDENTIFIED BY '$PASSWORD'" >> $INITFILE
fi


# init ejbca db
cat > INITFILE <<EOF
create database ejbca;
grant all privileges on ejbca.* to 'ejbca'@'localhost' identified by 'ejbca';
flush privileges;
EOF

mysqld_safe --init-file=$INITFILE
mysql_secure_installation

# mysql -u root -e "/tmp/ejbca.sql"