FROM centos:latest

MAINTAINER twist@vkyii.com

ENV ANDROID_HOME=/usr/local/android-sdk-linux \
    ANDROID_SDK_FILE=android-sdk_r24.4.1-linux.tgz \
    JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk \
    GRADLE_VERSION=2.4 \
    GRADLE_HOME=/opt/gradle \
    TERM=xterm

ENV PATH $JAVA_HOME/bin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$GRADLE_HOME/bin:$PATH

# [base]
RUN yum update -y \
 && yum install -y wget git unzip which \
 && yum clean all

# [java]
RUN yum install -y java-1.8.0-openjdk-devel \
 && yum clean all

# [android sdk]
RUN yum install -y glibc.i686 glibc-devel.i686 libstdc++.i686 zlib-devel.i686 ncurses-devel.i686 libX11-devel.i686 libXrender.i686 libXrandr.i686 \
 && cd /usr/local \
 && wget https://dl.google.com/android/$ANDROID_SDK_FILE \
 && tar -xzf $ANDROID_SDK_FILE \
 && rm $ANDROID_SDK_FILE && cd ~ \
 # [android tool and system images]
 && echo "y" | android update sdk --no-ui --force --all \
    --filter platform-tools,android-23,build-tools-23.0.1,extra-android-support,extra-android-m2repository,sys-img-x86_64-android-23,extra-google-m2repository \
 && yum clean all

# [gradle]
RUN cd /opt \
 && wget -N https://services.gradle.org/distributions/gradle-$GRADLE_VERSION-all.zip \
 && unzip gradle-$GRADLE_VERSION-all.zip \
 && ln -sf gradle-$GRADLE_VERSION gradle \
 && rm gradle-$GRADLE_VERSION-all.zip \
 && cd ~

# [node & react-native]
RUN curl --silent --location https://rpm.nodesource.com/setup_6.x | bash - \
 && yum install -y nodejs \
 && npm install -g react-native-cli \
 && yum clean all

# [jenkins]
RUN wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins.io/redhat-stable/jenkins.repo \
 && rpm --import http://pkg.jenkins.io/redhat-stable/jenkins.io.key \
 && yum install -y jenkins \
 && yum clean all

# [tini]
ENV TINI_VERSION v0.9.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]

# Start
EXPOSE 8080
CMD ["java", "-jar", "/usr/lib/jenkins/jenkins.war"]


# Ref:
# [node](https://nodejs.org/en/download/package-manager/#enterprise-linux-and-fedora)
# [android-sdk](https://developer.android.com/studio/index.html#downloads)
# [nimmis/docker-java-centos](https://github.com/nimmis/docker-java-centos)
# [krallin/tini](https://github.com/krallin/tini)
# [nekocode/docker-android](https://github.com/nekocode/docker-android)
# [emmby/docker-android](https://github.com/emmby/docker-android)