#!/usr/bin/sh
# Unread mail counts are handled by my mutt_daemon script, this one
#   just expects the info to be in the right place

eval __SENSORS_SYS="/home/ari/.config/dwm/__SENSORS_SYS"
eval __SENSORS_BATT="/home/ari/.config/dwm/__SENSORS_BATT"
eval __MAIL="/home/ari/.config/dwm/__MAIL"
eval __NET="/home/ari/.config/dwm/__NET"

touch $__SENSORS_SYS
touch $__SENSORS_BATT
touch $__NET

HOSTNAME=$(cat /etc/hostname)

#trap TEST 10 12

CMUS() {
  if ps -C cmus > /dev/null; then
    artist=`cmus-remote -Q |
    	grep --text '^tag artist' |
    	sed '/^tag artistsort/d' |
    	awk '{gsub("tag artist ", "");print}'`
    title=`cmus-remote -Q  |
    	grep --text '^tag title' |
    	sed -e 's/tag title //' |
    	awk '{gsub("tag title ", "");print}'`

    pos=`cmus-remote -Q | grep 'position' | awk '{print $2}'`
    dur=`cmus-remote -Q | grep 'duration' | awk '{print $2}'`

    echo "Now Playing: $artist - $title - $(date -d@$pos -u +%H:%M:%S)/$(date -d@$dur -u +%H:%M:%S) |"; else echo "";
  fi
}

BATT() {
  CHARGE=$(cat /sys/class/power_supply/BAT0/capacity)
  STATUS=$(cat /sys/class/power_supply/BAT0/status)
  if [ "$STATUS" = "Charging" ]; then
    FMTD=$(printf "🔌 %d% |" "$CHARGE")
  else
    FMTD=$(printf "🔋 %d% |" "$CHARGE")
  fi
  echo "$FMTD" > $__SENSORS_BATT
}

VOLU() {
  STATUS=$(amixer sget Master | tail -n1 | sed -r "s/.*\[(.*)\]/\1/")
  if [ "$STATUS" = "off" ]; then
    OUT="MUTE"
  else
    OUT=$(amixer sget Master | tail -n1 | sed -r "s/.*\[(.*)%\].*/\1/")"%"
  fi

  printf "🔉 %s" "$OUT"
}

TIME() {
  printf "%s" "$(date)"
}

SENSORS() {
  MEM=$(free -h | grep Mem | awk '{print $3,"/", $2}')

  if [ "$HOSTNAME" != "byzantium" ]; then
    CPU_TEMP=$(sensors | grep Package | awk '{print $4}')
  else
    CPU_TEMP=$(sensors | grep Tdie | awk '{print $2 $3}')
  fi

  if [ "$HOSTNAME" = "byzantium" ]; then
    GPU_TEMP=$(sensors | grep temp1 | awk '{print $2 $3}')
  fi

  CPU_USAG=$(top -bn1 | grep Cpu | awk '{print $2}')
  FMTD=$(printf "MEM: %s   CPU: %s%% (%s)   GPU: %s" "$MEM" "$CPU_USAG" "$CPU_TEMP" "$GPU_TEMP")
  echo "$FMTD" > $__SENSORS_SYS
}

# Not used for performance and clutter reasons, but nice to have.
# I will spin this off into its own little script
NET() {
  PRIVATE=$(nmcli -a | grep 'inet4 192' | awk '{print $2}')
  PUBLIC=$(curl -s https://ipinfo.io/ip)
  FMTD=$(printf "PRI: %s   PUB: %s" "$PRIVATE" "$PUBLIC")
  echo "$FMTD" > $__NET
}

parallel_10s() {
  while true
  do
    SENSORS &
    if [ "$(cat /etc/hostname)" != "byzantium" ]; then
      BATT &
    fi
    sleep 5
  done
}

parallel_10s &
NET &

while true
do
  TOPBAR=$(printf " %s %s %s | %s " "$(CMUS)" "$(cat $__SENSORS_BATT)" "$(VOLU)" "$(TIME)")
  BOTBAR=$(printf " %s | %s | %s | %s " "$(cat $__SENSORS_SYS)" "$(cat $__MAIL)" "$(cat $__NET)" "$(uptime -p)")
  xsetroot -name "$TOPBAR;$BOTBAR"
  sleep 0.2
done

