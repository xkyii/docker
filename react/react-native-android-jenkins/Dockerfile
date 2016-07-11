FROM centos:latest

MAINTAINER twist@vkyii.com

RUN curl --silent --location https://rpm.nodesource.com/setup_6.x | bash - \
 && yum update -y \
 && yum install -y nodejs \
 && npm install -g react-native-cli \
 && yum install -y java-1.8.0-openjdk





# Ref:
# [docker+centos7+java](https://github.com/nimmis/docker-java-centos)
# [node](https://nodejs.org/en/download/package-manager/#enterprise-linux-and-fedora)