FROM vkyii/alpine:latest

MAINTAINER vkyii@foxmail.com

RUN apk-install nginx ffmpeg \
 && mkdir -p /tmp/hls \
 && ln -sf /dev/stdout /var/log/nginx/access.log \
 && ln -sf /dev/stderr /var/log/nginx/error.log

ADD nginx.conf /etc/nginx/nginx.conf
ADD stat.xsl /etc/nginx/stat.xsl

VOLUME ["/var/log/nginx"]

WORKDIR /etc/nginx

EXPOSE 80 1935

CMD ["nginx"]
#CMD ["nginx", "-g", "daemon off;"]
