FROM centos:latest

MAINTAINER twist@vkyii.com

ENV ANDROID_HOME=/usr/local/android-sdk-linux \
	ANDROID_SDK_FILE=android-sdk_r24.4.1-linux.tgz

ENV PATH $ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH

RUN cd ~ && yum update -y \
 && yum install -y wget
 # [java]
 && yum install -y java-1.8.0-openjdk \
 # [android sdk]
 && cd /usr/local \
 && wget https://dl.google.com/android/$ANDROID_SDK_FILE \
 && tar -xzf $ANDROID_SDK_FILE \
 && rm $ANDROID_SDK_FILE && cd ~ \
 # [android tool and system images]
 && echo "y" | android update sdk --no-ui --force --all \
 	--filter platform-tools,android-23,build-tools-23.0.1,extra-android-support,extra-android-m2repository,sys-img-x86_64-android-23,extra-google-m2repository \
 # [node]
 && curl --silent --location https://rpm.nodesource.com/setup_6.x | bash - \
 && yum install -y nodejs \
 # [react-native]
 && npm install -g react-native-cli \
 # [clean]
 && yum clean all




# Ref:
# [docker+centos7+java](https://github.com/nimmis/docker-java-centos)
# [node](https://nodejs.org/en/download/package-manager/#enterprise-linux-and-fedora)