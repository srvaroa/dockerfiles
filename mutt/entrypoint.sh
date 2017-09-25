#!/bin/sh
set -e

if [ -z "$EMAIL" ]; then
    echo >&2 'error: missing EMAIL environment variable'
    echo >&2 '  try running again with -e EMAIL=your-email@gmail.com'
    echo >&2 '    optionally, you can also specify -e EMAIL_PASS'
    echo >&2 '    -e EMAIL_NAME="Your Name" and EMAIL_FROM=email@your-domain.com'
    echo >&2 '      if not specified, both default to the value of EMAIL'
    exit 1
fi

if [ -z "$EMAIL_NAME" ]; then
    EMAIL_NAME="$EMAIL"
fi

if [ -z "$EMAIL_FROM" ]; then
    EMAIL_FROM="$EMAIL"
fi

if [ -z "$IMAP_SERVER" ]; then
    IMAP_SERVER="imap.gmail.com:993"
fi

if [ -z "$SMTP_SERVER" ]; then
    SMTP_SERVER="smtp.gmail.com"
fi

sed -i "s/%EMAIL%/$EMAIL/g"       "$HOME/.mutt/muttrc"
sed -i "s/%EMAIL_NAME%/$EMAIL_NAME/g"   "$HOME/.mutt/muttrc"
sed -i "s/%EMAIL_PASS%/$EMAIL_PASS/g"   "$HOME/.mutt/muttrc"
sed -i "s/%EMAIL_FROM%/$EMAIL_FROM/g"   "$HOME/.mutt/muttrc"
sed -i "s/%IMAP_SERVER%/$IMAP_SERVER/g" "$HOME/.mutt/muttrc"
sed -i "s/%SMTP_SERVER%/$SMTP_SERVER/g" "$HOME/.mutt/muttrc"

exec "$@"

