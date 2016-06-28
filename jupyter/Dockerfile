FROM centos:latest

MAINTAINER vkyii@foxmail.com

RUN yum -y install wget bzip2
RUN wget http://repo.continuum.io/archive/Anaconda3-4.0.0-Linux-x86_64.sh -O build.sh
RUN bash build.sh -b -p /opt/anaconda
RUN rm build.sh

ENV PATH /opt/anaconda/bin:$PATH

# volumn set
WORKDIR /data

EXPOSE 8888

CMD jupyter notebook