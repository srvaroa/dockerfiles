# Run Mutt from a container
# Mostly copied from  https://github.com/jessfraz/dockerfiles

# docker run -it \
#   -v /etc/localtime:/etc/localtime:ro \
#   -e EMAIL      # all below are optional \
#   -e EMAIL_NAME \
#   -e EMAIL_PASS \
#   -e EMAIL_FROM \
#   -e SMTP_SERVER \
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
    links \
    git \
    gnupg1 \
    mutt \
    mutt-doc \
    vim

ENV BROWSER links

USER user
ENV HOME /home/user
ENV TERM xterm-256color
RUN mkdir -p $HOME/.mutt/cache/headers \
             $HOME/.mutt/cache/bodies \
             $HOME/.mutt/temp \
    && touch $HOME/.mutt/certificates

RUN git clone --depth 1 https://github.com/srvaroa/rc $HOME/rc \
    && cp $HOME/rc/.vim/vimrc $HOME/.vimrc \
    && cp $HOME/rc/mutt/* $HOME/.mutt/

ENV LANG C.UTF-8

COPY    entrypoint.sh   /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["mutt", "-F", "~/.mutt/muttrc"]
