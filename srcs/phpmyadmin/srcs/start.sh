#!/bin/sh


chown -R /var/www/phpmyadmin
chmod -R 765 /var/www/phpmyadmin
#nginx -c /etc/nginx/nginx.conf
mkdir /etc/nginx/ssl
rm /etc/nginx/http.d/default.conf
openssl req -new -newkey rsa:4096 -x509 -nodes \
    -keyout /etc/nginx/ssl/mysite.key -out /etc/nginx/ssl/mysite.crt \
    -subj "/C=FR/ST=IDF/L=PARIS/O=42/CN=mysite"
php-fpm7
nginx -g 'daemon off;'
