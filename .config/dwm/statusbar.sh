#!/usr/bin/sh

eval __SENSORS_SYS="/home/ari/.config/dwm/__SENSORS_SYS"
eval __SENSORS_BATT="/home/ari/.config/dwm/__SENSORS_BATT"
eval __TIME="/home/ari/.config/dwm/__MAIL"

touch $__SENSORS_SYS
touch $__SENSORS_BATT

trap TEST 10 12

BATT() {
  CHARGE=$(cat /sys/class/power_supply/BAT0/capacity)
  STATUS=$(cat /sys/class/power_supply/BAT0/status)
  if [ "$STATUS" = "Charging" ]; then
    FMTD=$(printf "🔌 %d%%" "$CHARGE")
  else
    FMTD=$(printf "🔋 %d%%" "$CHARGE")
  fi
  echo "$FMTD" > $__SENSORS_BATT
}

TEST() {
  echo "TEST2" > ./__MAIL
}

MAIL() {
  UNREAD_GMAIL=$(find ~/.local/share/mail/akmadian@gmail.com/INBOX/new -type f | wc -l)
  UNREAD=$(find ~/.local/share/mail/ari@madian.co/INBOX/new -type f | wc -l)

  FMTD=$(printf "📫 gm: %d co: %d" "$UNREAD_GMAIL" "$UNREAD")
  echo "$FMTD" > $__MAIL
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
  CPU_TEMP=$(sensors | grep Package | awk '{print $4}')
  CPU_USAG=$(top -bn1 | grep Cpu | awk '{print $2}')
  FMTD=$(printf "MEM: %s CPU: %s%% (%s)" "$MEM" "$CPU_USAG" "$CPU_TEMP")
  echo "$FMTD" > $__SENSORS_SYS
}

# Not used for performance and clutter reasons, but nice to have.
# I will spin this off into its own little script
NET() {
  PRIVATE=$(nmcli -a | grep 'inet4 192' | awk '{print $2}')
  PUBLIC=$(curl -s https://ipinfo.io/ip)
  printf "INT: %s PUB: %s" "$PRIVATE" "$PUBLIC"
}

parallel_10s() {
  while true
  do
    SENSORS &
    BATT &
    MAIL &
    sleep 5
  done
}

parallel_10s &

while true
do
  OUT=$(printf " %s | %s | %s | %s | %s " "$(cat $__SENSORS_SYS)" "$(cat $__MAIL)" "$(cat $__SENSORS_BATT)" "$(VOLU)" "$(TIME)")
  xsetroot -name "$OUT"
  sleep 0.2
done

