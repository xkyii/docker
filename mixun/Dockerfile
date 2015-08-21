FROM vkyii/mixun:base

MAINTAINER vkyii@foxmail.com

#
# TODO
# 增加Openssl Enginge
# 增加Server
#

# REF http://stackoverflow.com/questions/23391839/clone-private-git-repo-with-dockerfile

WORKDIR /build

# Copy over private key, and set permissions
ADD id_rsa /root/.ssh/id_rsa

RUN apk-install --virtual build-deps git build-base \
 #	compile opensslib
 && git clone git@bitbucket.org:vkyii/opensslib.git \
 && cd opensslib/build/proj.linux/SJK0817400RE/libSJK0817400RE \
 && make CONFIG=Debug \
 && cp Debug/libSJK0817400RE.so /usr/lib64/openssl/engines/ \
 #	clear
 && apk del build-deps \
 && rm -rf /build