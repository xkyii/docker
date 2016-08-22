FROM centos:latest

MAINTAINER twist@vkyii.com

ENV ANACONDA_SH=Anaconda3-4.1.1-Linux-x86_64.sh \
    ANACONDA_PATH=/opt/anaconda

ENV PATH $ANACONDA_PATH/bin:$PATH

RUN yum -y install wget bzip2 \
 && wget http://repo.continuum.io/archive/$ANACONDA_SH \
 && bash $ANACONDA_SH -b -p $ANACONDA_PATH \
 && rm $ANACONDA_SH

# [tini]
ENV TINI_VERSION v0.10.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]

CMD [ "/bin/bash" ]