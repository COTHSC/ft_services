FROM	alpine

RUN		apk update \
&& apk add influxdb \
&& apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache



RUN mkdir -p /etc/telegraf
COPY ./srcs/telegraf.conf /etc/telegraf/telegraf.conf

EXPOSE	8088

COPY ./srcs/start.sh /

ENTRYPOINT sh start.sh
