FROM	alpine

RUN		apk update \
&& apk add openrc openssh openssl \
&& apk add wget php7 php7-fpm php7-mysqli php7-mbstring php7-json php7-session nginx openssl \
&& mkdir -p www \
&& cd www \
&& wget https://files.phpmyadmin.net/phpMyAdmin/4.9.2/phpMyAdmin-4.9.2-all-languages.tar.gz \
&& tar -xzvf phpMyAdmin-4.9.2-all-languages.tar.gz \
&& mv phpMyAdmin-4.9.2-all-languages phpmyadmin \
&& rm -rf phpMyAdmin-4.9.2-all-languages.tar.gz 

RUN adduser -D -g 'www' www

RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
RUN mkdir /run/nginx



COPY	/srcs/start.sh /
COPY	/srcs/mysite /etc/nginx/http.d/pma.conf
COPY	/srcs/config.inc.php /www/phpmyadmin/config.inc.php

EXPOSE	5000

ENTRYPOINT sh start.sh
