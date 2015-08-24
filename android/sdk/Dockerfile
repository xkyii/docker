FROM vkyii/alpine:latest

MAINTAINER vkyii@foxmail.com

ENV ANDROID_SDK_FILENAME android-sdk_r23.0.2-linux.tgz
ENV ANDROID_SDK_URL http://dl.google.com/android/${ANDROID_SDK_FILENAME}
ENV ANDROID_API_LEVELS android-15,android-16,android-17,android-18,android-19,android-20,android-21 
ENV ANDROID_BUILD_TOOLS_VERSION 21.1.0
ENV ANDROID_HOME /opt/android-sdk-linux
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools

RUN apk-install ca-certificates \
 && mkdir -p /opt \
 && cd /opt \
 && wget -q ${ANDROID_SDK_URL} \
 && tar -xzf ${ANDROID_SDK_FILENAME} \
 && rm -rf ${ANDROID_SDK_FILENAME} \
 && android update sdk --no-ui -a --filter tools,platform-tools,${ANDROID_API_LEVELS},build-tools-${ANDROID_BUILD_TOOLS_VERSION}