FROM gliderlabs/alpine:latest

MAINTAINER vkyii@foxmail.com

RUN apk-install bash

RUN wget http://repo.continuum.io/archive/Anaconda3-4.0.0-Linux-x86_64.sh
RUN bash Anaconda3-4.0.0-Linux-x86_64.sh -b -p /opt/anaconda
RUN rm Anaconda3-4.0.0-Linux-x86_64.sh

ENV PATH /opt/anaconda/bin:$PATH

# volumn set
WORKDIR /data

EXPOSE 8888

CMD jupyter notebook