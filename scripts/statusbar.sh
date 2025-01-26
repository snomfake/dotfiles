#!/bin/sh

getNetwork() {
  while true
  do
    if ping -c 1 -W 5 google.com 1>/dev/null 2>&1 ; then
      echo ""
      break
    else
      echo ""
      sleep 1
    fi
  done
}

getLang() {
  xset -q|grep LED| awk '{if(substr ($10,5,1) ==1) print " RU"; else print " US"}'
}

getTime() {
  date +" %H:%M"
}

case $1 in
  "network" )
    getNetwork ;;
  "lang" )
    getLang ;;
  "time" )
    getTime ;;
esac
