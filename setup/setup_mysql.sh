#!/bin/ash

if [ -f /usr/bin/mysqld_safe ]; then
   /usr/bin/mysqld_safe &
   sleep 10
   /usr/bin/mysqladmin -u root password 'password'
   killall mysqld
   sleep 10
fi
