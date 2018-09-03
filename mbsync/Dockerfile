# For now, this requires building the container from a folder that has
# the .mbsyncrc file to be used.
FROM alpine:latest
LABEL maintainer "Galo Navarro <anglorvaroa@gmail.com>"

RUN addgroup -g 1000 user \
    && adduser -D -h /home/user -G user -u 1000 user

RUN apk --no-cache add \
        isync \
        git \
        ca-certificates

USER user
ENV HOME /home/user
ENV LANG C.UTF-8

RUN git clone --depth 1 https://github.com/srvaroa/dotfiles $HOME/dotfiles

COPY .mbsyncrc $HOME/.mbsyncrc
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["sh", "/entrypoint.sh"]

CMD ["mbsync", "-V", "gmail"]
