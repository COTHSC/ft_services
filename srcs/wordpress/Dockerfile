FROM	alpine

RUN		apk update \
&& apk add openrc openssh openssl \
&& apk add wget php7 php7-fpm php7-mysqli php7-mbstring php7-json php7-session nginx openssl \
&& mkdir /www \
&& cd /www \
&& wget http://wordpress.org/latest.tar.gz \
&& tar -xzvf latest.tar.gz \
&& rm latest.tar.gz && cd /

RUN adduser -D -g 'www' www

RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www


RUN mkdir /run/nginx

COPY	/srcs/start.sh /
COPY	/srcs/mysite /etc/nginx/http.d/mysite.conf
COPY	/srcs/wp-config.php /www/wordpress/wp-config.php

EXPOSE	5050

ENTRYPOINT sh start.sh
