FROM centos:latest

MAINTAINER twist@vkyii.com

ENV ANDROID_HOME=/usr/local/android-sdk-linux \
    ANDROID_SDK_FILE=android-sdk_r24.4.1-linux.tgz \
    TERM=xterm

ENV PATH $ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH

RUN cd ~ && yum update -y \
 && yum install -y wget git unzip which\
 # [java]
 && yum install -y java-1.8.0-openjdk \
 && echo JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:bin/java::") >> /etc/environment
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
 # [jenkins]
 && wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins.io/redhat-stable/jenkins.repo \
 && rpm --import http://pkg.jenkins.io/redhat-stable/jenkins.io.key \
 && yum install -y jenkins \
 # [clean]
 && yum clean all

# Add Tini
ENV TINI_VERSION v0.9.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]

# Env
ENV PATH $JAVA_HOME/bin:$PATH

# Start
EXPOSE 8080
CMD ["java", "-jar", "/usr/lib/jenkins/jenkins.war"]


# Ref:
# [docker+centos7+java](https://github.com/nimmis/docker-java-centos)
# [node](https://nodejs.org/en/download/package-manager/#enterprise-linux-and-fedora)
# [android-sdk](https://developer.android.com/studio/index.html#downloads)
# [tini](https://github.com/krallin/tini)