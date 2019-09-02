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

# ~/.mbsyncrc_original is put there by the run script, and then
# passwords get injected from env variables.  I have to use this
# _original file because sed makes a file replacement that changes
# inode, which is not permitted on volume mounts (as .msyncrc_original
# is)
sed "s/%G_PASSWORD%/$G_PASSWORD/g" $HOME/.mbsyncrc_original > $HOME/.mbsyncrc
sed -i "s/%V_PASSWORD%/$V_PASSWORD/g" $HOME/.mbsyncrc

mbsync -V $CHANNEL
