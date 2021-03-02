#!/usr/bin/sh
# Checks for new mail every 5 minutes, if there is new mail, sends
#   a notification with herbe

while true
do
  UNREAD_GM=$(find ~/.local/share/mail/akmadian@gmail.com/INBOX/new -type f | wc -l)
  UNREAD_CO=$(find ~/.local/share/mail/ari@madian.co/INBOX/new -type f | wc -l)

  mbsync -a
  NEW_UNREAD_GM=$(find ~/.local/share/mail/akmadian@gmail.com/INBOX/new -type f | wc -l)
  NEW_UNREAD_CO=$(find ~/.local/share/mail/ari@madian.co/INBOX/new -type f | wc -l)

  GM_DIFF=$NEW_UNREAD_GM-$UNREAD_GM
  CO_DIFF=$NEW_UNREAD_CO-$UNREAD_CO

  if [ $GM_DIFF -gt 0 ] || [ $CO_DIFF -gt 0 ]; then
    NOTIF_TEXT="New Mail Received"

    if [ $GM_DIFF -gt 0 ]; then
      NOTIF_GM="akmadian@gmail.com ($GM_DIFF)"
    fi
    if [ $CO_DIFF -gt 0 ]; then
      NOTIF_CO="ari@madian.co ($CO_DIFF)"
    fi

    herbe "$NOTIF_TEXT" "${NOTIF_GM:-}" "${NOTIF_CO:-}"
  fi

  sleep 300
done

