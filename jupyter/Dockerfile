FROM centos:latest

MAINTAINER twist@vkyii.com

ENV ANACONDA_SH=Anaconda3-4.0.0-Linux-x86_64.sh \
    ANACONDA_PATH=/opt/anaconda

RUN yum -y install wget bzip2 \
 && wget http://repo.continuum.io/archive/$ANACONDA_SH \
 && bash $ANACONDA_SH -b -p $ANACONDA_PATH \
 && rm $ANACONDA_SH

ENV PATH $ANACONDA_PATH/bin:$PATH

# config
ADD .jupyter/jupyter_notebook_config.py /root/.jupyter/jupyter_notebook_config.py

VOLUME /notebooks
WORKDIR /notebooks

EXPOSE 8888

CMD jupyter notebook