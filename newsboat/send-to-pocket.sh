#!/bin/sh
# Based in
# - https://github.com/newsboat/newsboat/blob/e6386794feb42f8a18667b98c848473453110c0f/contrib/getpocket.com/send-to-pocket.sh
# but using a different auth's method (creds provided by https://github.com/srvaroa/repocket)

METHOD_URL="https://getpocket.com/v3/add"
CONSUMER_KEY=$(cat ~/.repocket/config | grep consumer_key | cut -f2 -d' ')
ACCESS_TOKEN=$(cat ~/.repocket/config | grep access_token | cut -f2 -d' ')

TITLE="$2"
URL="$1"

PARAMS="{\"url\":\"$URL\", \"title\":\"$TITLE\", \"consumer_key\":\"$CONSUMER_KEY\", \"access_token\":\"$ACCESS_TOKEN\"}" 

output=`wget --post-data "$PARAMS" --header="Content-Type: application/json" $METHOD_URL -O - 2>/dev/null`

