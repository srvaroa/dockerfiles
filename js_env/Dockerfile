FROM alpine:edge
LABEL maintainer "Galo Navarro <anglorvaroa@gmail.com>"

RUN addgroup -g 1000 user \
    && adduser -D -h /home/user -G user -u 1000 user

RUN apk --no-cache --update add \
    bash \
    git \
    gnupg \
    nodejs \
    nodejs-npm \
    yarn

RUN npm install -g vue-cli
RUN yarn global add vue-cli

USER user
ENV HOME /home/user
ENV TERM xterm-256color

ENV LANG C.UTF-8
