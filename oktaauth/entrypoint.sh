#!/bin/sh
set -e

exec /home/user/bin/oktaauth \
    --username $USER \
    --server $SERVER \
    --apptype $APPTYPE \
    --appid $APPID
