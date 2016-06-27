FROM gliderlabs/alpine:latest

MAINTAINER vkyii@foxmail.com

# http://bugs.python.org/issue19846
# > At the moment, setting "LANG=C" on a Linux system *fundamentally breaks Python 3*, and that's not OK.
ENV ALPINE_EDGE_COMMUNITY_REPO=http://dl-cdn.alpinelinux.org/alpine/edge/community \
    ALPINE_GLIBC_BASE_URL=https://github.com/andyshinn/alpine-pkg-glibc/releases/download/unreleased \
    ALPINE_GLIBC_PACKAGE=glibc-2.23-r1.apk \
    ALPINE_GLIBC_BIN_PACKAGE=glibc-bin-2.23-r1.apk \
    ALPINE_GLIBC_I18N_PACKAGE=glibc-i18n-2.23-r1.apk \
    ANDY_SHINN_RSA_PUB_URL=https://raw.githubusercontent.com/andyshinn/alpine-pkg-glibc/master/andyshinn.rsa.pub \
    CONDA_REPO=https://repo.continuum.io \
    CONDA_TYPE=archive \
    CONDA_INSTALLER=Anaconda3-4.0.0-Linux-x86_64.sh \
    CONDA_DIR=/opt/conda \
    CONDA_USER=conda \
    CONDA_USER_HOME=/home/conda \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8 \
    PATH=/opt/conda/bin:$PATH

# Here we use several hacks collected from https://github.com/gliderlabs/docker-alpine/issues/11
# 1. install GLibc (which is not the cleanest solution at all)
# 2. hotfix /etc/nsswitch.conf, which is apperently required by glibc and is not used in Alpine Linux
RUN apk --update add \
    bash \
    bzip2 \
    ca-certificates \
    curl \
    git \
    glib \
    expat \
    jq \
    less \
    libgcc \
    libsm \
    libstdc++ \
    libxext \
    libxrender \
    ncurses-terminfo-base \
    ncurses-terminfo \
    ncurses-libs \
    openssh-client \
    readline \
    unzip \
    && apk add --update --repository ${ALPINE_EDGE_COMMUNITY_REPO} tini \
    && cd /tmp \
    && wget -q -O /etc/apk/keys/andyshinn.rsa.pub "${ANDY_SHINN_RSA_PUB_URL}" \
    && wget -q "${ALPINE_GLIBC_BASE_URL}/${ALPINE_GLIBC_PACKAGE}" \
               "${ALPINE_GLIBC_BASE_URL}/${ALPINE_GLIBC_BIN_PACKAGE}" \
               "${ALPINE_GLIBC_BASE_URL}/${ALPINE_GLIBC_I18N_PACKAGE}" \
    && apk add ${ALPINE_GLIBC_PACKAGE} ${ALPINE_GLIBC_BIN_PACKAGE} ${ALPINE_GLIBC_I18N_PACKAGE} \
    && /usr/glibc-compat/bin/localedef -i en_US -f UTF-8 en_US.UTF-8 \
    && wget -q "${CONDA_REPO}/${CONDA_TYPE}/${CONDA_INSTALLER}" \
    && bash ./"${CONDA_INSTALLER}" -b -p /opt/conda \
    && cd \
    && rm -rf /tmp/* /var/cache/apk/* \
    && echo 'export PATH=/opt/conda/bin:$PATH' >> /etc/profile.d/conda.sh \
    && conda update --quiet --yes --all \
    && conda clean --yes --tarballs \
    && conda clean --yes --packages

RUN adduser -s /bin/bash -G users -D ${CONDA_USER}
WORKDIR ${CONDA_USER_HOME}
USER conda
RUN conda create --quiet -n conda3 --clone=${CONDA_DIR}

ENTRYPOINT ["tini", "--"]
CMD ["conda.sh"]

# Add local files as late as possible to stay cache friendly
COPY conda.sh /usr/local/bin/

# RUN apk-install bash bzip2

# RUN wget http://repo.continuum.io/archive/Anaconda3-4.0.0-Linux-x86_64.sh -O build.sh
# RUN bash build.sh -b -p /opt/anaconda
# RUN rm build.sh

# ENV PATH /opt/anaconda/bin:$PATH

# # volumn set
# WORKDIR /data

# EXPOSE 8888

# CMD jupyter notebook