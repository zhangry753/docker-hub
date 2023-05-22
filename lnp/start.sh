#!/bin/bash

mkdir -p /logs/nginx /logs/php-fpm /logs/applogs /logs/cron
chown -R www:www /logs/nginx /logs/php-fpm /logs/applogs /logs/cron

#/usr/sbin/rsyslogd
#/usr/sbin/crond
/usr/sbin/php-fpm
/usr/bin/memcached -d -u www -l 127.0.0.1
exec /usr/sbin/nginx -g "daemon off;"