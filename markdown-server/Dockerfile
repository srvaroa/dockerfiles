# docker run -it \
#   -v /etc/localtime:/etc/localtime:ro \
#   -e IMAP_SERVER \
#   --name mutt \
#   mutt
#
FROM alpine:edge
LABEL maintainer "Galo Navarro <anglorvaroa@gmail.com>"

RUN addgroup -g 1000 user \
    && adduser -D -h /home/user -G user -u 1000 user

RUN apk --no-cache add \
    ca-certificates \
    git \
    py-pip \
    vim

RUN pip install --upgrade pip \
    && pip install markdown-server

USER user
ENV HOME /home/user
ENV BROWSER links
ENV TERM xterm-256color
ENV LANG C.UTF-8

ENTRYPOINT ["markdownserver"]
