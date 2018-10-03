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

export G_PASSWORD=$(gpg -q -d $1 | grep G= | cut -f2 -d=)
export V_PASSWORD=$(gpg -q -d $1 | grep V= | cut -f2 -d=)
export MAILDIR="$2"

docker run --rm \
    -e G_PASSWORD \
    -e V_PASSWORD \
    -e MAILDIR \
    -v $MAILDIR:/home/user/.mail \
    mbsync
