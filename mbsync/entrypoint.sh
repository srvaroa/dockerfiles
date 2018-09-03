#!/bin/bash -x
set -e

if [ -z "$PASSWORD" ]; then
  echo >&2 'error: missing PASSWORD'
  exit 1
fi

if [ -z "$MAILDIR" ]; then
  echo >&2 'error: missing MAILDIR'
  exit 1
fi

sed -i "s/%PASSWORD%/$PASSWORD/g" $HOME/.mbsyncrc

exec "$@"
