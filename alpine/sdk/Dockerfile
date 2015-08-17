FROM gliderlabs/alpine:latest

RUN apk -U add alpine-sdk 
RUN adduser -G abuild -g "Alpine Package Builder" -s /bin/sh -D builder
RUN echo "builder ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
RUN rm -rf /var/cache/apk/*
