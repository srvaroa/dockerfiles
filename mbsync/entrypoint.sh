#!/bin/bash
set -e

if [ -z "$G_PASSWORD" ]; then
  echo >&2 'error: missing G_PASSWORD'
  exit 1
fi

if [ -z "$V_PASSWORD" ]; then
  echo >&2 'error: missing V_PASSWORD'
  exit 1
fi

sed -i "s/%G_PASSWORD%/$G_PASSWORD/g" $HOME/.mbsyncrc
sed -i "s/%V_PASSWORD%/$V_PASSWORD/g" $HOME/.mbsyncrc

mbsync -V $CHANNEL
