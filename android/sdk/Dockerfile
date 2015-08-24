FROM vkyii/openjdk7:latest

MAINTAINER vkyii@foxmail.com


ENV ANDROID_SDK_FILENAME android-sdk_r24.3.4-linux.tgz
ENV ANDROID_SDK_URL http://dl.google.com/android/${ANDROID_SDK_FILENAME}
ENV ANDROID_API_LEVELS android-19,android-21 
ENV ANDROID_BUILD_TOOLS_VERSION 21.1.0
ENV ANDROID_HOME /opt/android-sdk-linux
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools

WORKDIR /opt

RUN apk-install ca-certificates \
 && wget -q ${ANDROID_SDK_URL} \
 && tar -xzf ${ANDROID_SDK_FILENAME} \
 && rm -rf ${ANDROID_SDK_FILENAME} \
 #	&& echo 'y' | android update sdk --no-ui --proxy-host mirrors.opencas.cn --proxy-port 80 -s --filter ${ANDROID_API_LEVELS} 
 && echo 'y' | android update sdk --no-ui -s --filter ${ANDROID_API_LEVELS} 