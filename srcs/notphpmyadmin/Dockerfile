FROM alpine

#needed packages
RUN apk update
RUN apk add openrc --no-cache
RUN apk add openssh
RUN apk add openssl
RUN apk add nginx
#user creatioa




RUN apk add php7 php7-fpm php7-opcache
RUN apk add php7-gd php7-mysqli php7-zlib php7-curl 


RUN adduser -D -g 'www' www
#setup server files
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
RUN mkdir /run/nginx
CMD touch /run/openrc/softlevel

#create ssh user & ssl key
RUN adduser -D user
RUN echo "user:password:"|chpasswd
RUN ssh-keygen -A
RUN yes "" | openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/certs/localhost.key -out /etc/ssl/certs/localhost.crt

COPY setup.sh ./setup.sh
RUN chmod +x ./setup.sh
CMD sh ./setup.sh
EXPOSE 5000
