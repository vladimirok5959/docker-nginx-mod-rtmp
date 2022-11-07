FROM debian:latest
MAINTAINER Volodymyr Tkach <vladimirok5959@gmail.com>

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update && \
	apt-get -y upgrade && \
	apt-get -y install build-essential && \
	apt-get -y install libpcre3 && \
	apt-get -y install libpcre3-dev && \
	apt-get -y install libssl-dev && \
	apt-get -y install curl && \
	apt-get -y install nginx && \
	apt-get -y install ffmpeg && \
	apt-get -y install libnginx-mod-rtmp && \
	mkdir /var/www/html/recordings && \
	chown -R www-data:www-data /var/www/html/recordings && \
	echo "" >> /root/.profile && \
	echo "TIME_ZONE=\$(cat /etc/timezone)" >> /root/.profile && \
	echo "export TZ=\"\${TIME_ZONE}\"" >> /root/.profile && \
	echo "" >> /root/.bashrc && \
	echo "TIME_ZONE=\$(cat /etc/timezone)" >> /root/.bashrc && \
	echo "export TZ=\"\${TIME_ZONE}\"" >> /root/.bashrc

COPY --chown=root:root ./docker /

EXPOSE 1935
EXPOSE 8999

STOPSIGNAL SIGQUIT

CMD /usr/sbin/nginx
