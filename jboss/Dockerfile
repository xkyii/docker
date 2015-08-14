FROM vkyii/java:openjdk7

MAINTAINER vkyii@foxmail.com

ENV JBOSS_HOME /opt/jboss-as-7.1.1.Final

WORKDIR /build

RUN mkdir -p /opt \
 && wget http://download.jboss.org/jbossas/7.1/jboss-as-7.1.1.Final/jboss-as-7.1.1.Final.tar.gz \
 && tar -zxf jboss-as-7.1.1.Final.tar.gz -C /opt \
 && rm -rf /build


# Expose the ports we're interested in
EXPOSE 8080 8443

# Set the default command to run on boot
# This will boot WildFly in the standalone mode and bind to all interface
CMD ["/opt/jboss-as-7.1.1.Final/bin/standalone.sh", "-b", "0.0.0.0"]