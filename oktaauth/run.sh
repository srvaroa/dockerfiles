#!/bin/bash -x

# oktaauth --username joebloggs \
#          --server acemeinc.okta.com \
#          --apptype amazon_aws \
#          --appid exk5c0llc \

USER=$1 SERVER="$2.okta.com" APPTYPE="$3" APPID="$4" \
    docker run --rm -it \
    -e USER -e SERVER -e APPTYPE -e APPID \
    --name oktaauth oktaauth
