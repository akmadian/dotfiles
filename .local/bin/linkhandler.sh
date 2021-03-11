#!/bin/bash
#URL=$(echo $1 | sed 's/(\S*<=jpg)/ /g')

case "$1" in
  *png|*jpg|*jpe|*jpeg|*gif|*twimg*)
    herbe "Opening Image" "($1)" &
    NAME=$(echo $1 | sed 's/name=\S*/ /g')
    cd /tmp && curl -sO $NAME ; cd - > /dev/null
    P="/tmp/$( echo $NAME | sed 's/.*\///;s/%20/ /g')"
    feh $P > /dev/null
    ;;
  *)
    herbe "Unknown link type, opeing in browser." &
    brave $1 > /dev/null
    ;;
esac

