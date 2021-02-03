#!/bin/sh

dwm_spotify () {
    if ps -C spotify > /dev/null; then
        PLAYER="spotify"
    elif ps -C spotifyd > /dev/null; then
        PLAYER="spotifyd"
    fi

    if [ "$PLAYER" = "spotify" ] || [ "$PLAYER" = "spotifyd" ]; then
        ARTIST=$(playerctl metadata artist)
        TRACK=$(playerctl metadata title)
        POSITION=$(playerctl position | sed 's/..\{6\}$//')
        DURATION=$(playerctl metadata mpris:length | sed 's/.\{6\}$//')
        STATUS=$(playerctl status)
        SHUFFLE=$(playerctl shuffle)

        if [ "$IDENTIFIER" = "unicode" ]; then
            if [ "$STATUS" = "Playing" ]; then
                STATUS="▶"
            else
                STATUS="⏸"
            fi

            if [ "$SHUFFLE" = "On" ]; then
                SHUFFLE=" 🔀"
            else
                SHUFFLE=""
            fi
        else
            if [ "$STATUS" = "Playing" ]; then
                STATUS="PLA"
            else
                STATUS="PAU"
            fi

            if [ "$SHUFFLE" = "On" ]; then
                SHUFFLE=" S"
            else
                SHUFFLE=""
            fi
        fi

        if [ "$PLAYER" = "spotify" ]; then
            printf "%s%s %s - %s " "$SEP1" "$STATUS" "$ARTIST" "$TRACK"
            printf "%0d:%02d" $((DURATION%3600/60)) $((DURATION%60))
            printf "%s\n" "$SEP2"
        else
            printf "%s%s %s - %s " "$SEP1" "$STATUS" "$ARTIST" "$TRACK"
            printf "%0d:%02d/" $((POSITION%3600/60)) $((POSITION%60))
            printf "%0d:%02d" $((DURATION%3600/60)) $((DURATION%60))
            printf "%s%s\n" "$SHUFFLE" "$SEP2"
        fi
    fi
}

refresh() {
  # Alsa audio
  STATUS=$(amixer sget Master | tail -n1 | sed -r "s/.*\[(.*)\]/\1/")
  VOL=$(amixer get Master | tail -n1 | sed -r "s/.*\[(.*)%\].*/\1/")
  volstat=""
  if [ "$STATUS" = "off" ]; then
    volstat="MUTE"
  else
    volstat="$(printf "VOL %s%%" "$VOL")"
  fi

#  MEM=$(free -h | awk '/^Mem:/ {print $3 "/" $2}')
#  CPU=$(top -bn1 | grep Cpu | awk '{print $2}')
#  CPU_TEMP=$(sensors | awk '/^Tdie/ {print $2}')

  out=""
#  out="$out$(printf "MEM %s CPU %s (%s)" "$MEM" "$CPU" "$CPU_TEMP") | "
  out="$out$volstat | "
  out="$out$(printf "%s" "$(date "+%a, %B %d %H:%M:%S")")"
  xsetroot -name "$out"
}



# -d for run daemonize, not exactly a daemon but still
if [ X"$1" = X"-d" ]; then
  echo "Daemonizing"
  while true
  do
    refresh
    sleep 0.1
  done
else
  echo "Running once"
  refresh
  exit
fi
