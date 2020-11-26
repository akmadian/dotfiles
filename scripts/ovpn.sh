#!/bin/bash
OPTS=`getopt -o vhns: --long start,stop,status,connect -n 'parse-options' -- "$@"`

if [ $? != 0 ] ; then echo "Failed parsing options." >&2 ; exit 1 ; fi
eval set -- "$OPTS"

SHOWSTATUS=false

while true; do
  case "$1" in
    -v | --start )
      sudo systemctl start openvpn@server
      SHOWSTATUS=true
      shift ;;
    -h | --stop )    
      sudo systemctl stop openvpn@server
      SHOWSTATUS=true
      shift ;;
    -n | --status )  
      sudo systemctl status openvpn@server
      shift ;;
    -s | --connect ) 
      sudo openvpn /etc/openvpn/client/client.conf
      shift
      shift ;;
    -- ) shift; break ;;
    * ) break ;;
  esac
done

if [ $SHOWSTATUS = true ]; then
  sudo systemctl status openvpn@server;
fi