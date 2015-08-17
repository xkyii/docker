FROM vkyii/docker.os:alpine.sdk

USER builder

ENTRYPOINT ["abuild", "-r"]

WORKDIR /package

ENV PACKAGER_PRIVKEY /package/abuild.rsa
ENV REPODEST /packages
ENV PACKAGER vkyii <vkyii@foxmail.com>

ONBUILD RUN abuild-apk update
ONBUILD COPY . /package
ONBUILD RUN sudo mv *.rsa.pub /etc/apk/keys/
ONBUILD RUN sudo mkdir /packages
ONBUILD RUN udo chown -R builder /package /packages
