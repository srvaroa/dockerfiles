#!/bin/bash -x
# usage: $0 email@account.com

DOMAIN=$(echo $1 | cut -f2 -d@)

EMAIL=$1 SMTP_SERVER="smtp.$DOMAIN" IMAP_SERVER="imap.$DOMAIN" \
    docker run --rm -it -v /etc/localtime:/etc/localtime:ro \
    -e EMAIL -e SMTP_SERVER -e IMAP_SERVER \
    --name mutt mutt
