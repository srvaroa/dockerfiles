#!/bin/bash

function usage_and_exit {
    echo >&2 "MUTT_PW_FILE must be set"
    exit 1
}

if [ -z ${MUTT_PW_FILE} ] ; then
    usage_and_exit
fi

export G_PASSWORD=$(gpg -q -d $MUTT_PW_FILE | grep G= | cut -f2 -d=)
export V_PASSWORD=$(gpg -q -d $MUTT_PW_FILE | grep V= | cut -f2 -d=)
export CHANNEL=${1:--a}

docker run --rm \
    --dns=1.1.1.1 \
    -e G_PASSWORD \
    -e V_PASSWORD \
    -e CHANNEL \
    -v ~/.mbsyncrc:/home/user/.mbsyncrc_original \
    -v ~/.mail:/home/user/.mail \
    mbsync
