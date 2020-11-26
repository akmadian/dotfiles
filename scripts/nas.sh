#!/bin/bash
OPTS=`getopt -o vhns: --long umall,list,mount: -n 'parse-options' -- "$@"`

if [ $? != 0 ] ; then echo "Failed parsing options." >&2 ; exit 1 ; fi
eval set -- "$OPTS"

while true; do
  case "$1" in
    -u | --umall )
      sudo umount -a
      shift ;;
    -l | --list )
      sudo mount -l
    -m | --mount ) 
      sudo mount 192.168.0.6:/nfs/$2 ~/descartes/$2
      shift
      shift ;;
    -- ) shift; break ;;
    * ) break ;;
  esac
done