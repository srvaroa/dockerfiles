#!/bin/bash

function usage_and_exit {
    echo >&2 "Usage: $0 <password_file> <maildir>"
    exit 1
}

if [ "$#" != 2 ]; then
    usage_and_exit
fi

if [ -z $1 ] || [ -z $2 ]; then
    usage_and_exit
fi

export PASSWORD=$(gpg -d $1)
export MAILDIR="$2"

docker run --rm \
    -e PASSWORD \
    -e MAILDIR \
    -v $MAILDIR:/home/user/.mail \
    mbsync
