#!/bin/bash

mkdir -p /logs/nginx /logs/php-fpm /logs/applogs /logs/cron
chown -R www:www /logs/nginx /logs/php-fpm /logs/applogs /logs/cron

#/usr/sbin/rsyslogd
/usr/sbin/php-fpm
exec /usr/sbin/nginx -g "daemon off;"