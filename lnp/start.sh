#!/bin/bash

/usr/sbin/php-fpm
exec /usr/sbin/nginx -g "daemon off;"