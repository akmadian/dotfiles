#!/bin/bash
# (sw)itch (a)udio (o)utput
# copied from https://unix.stackexchange.com/questions/65246/change-pulseaudio-input-output-from-shell

TOGGLE1="CORSAIR_HS70"
TOGGLE2="analog-stereo"

# Discover which sink (output device) is active, and set up toggles
while read -r stream; do
  echo "$stream"
  if echo "$stream" | grep -q "RUNNING"; then
    currentSink=$(echo "$stream" | cut -f2)
  fi
  if echo "$stream" | grep -q "$TOGGLE1"; then
    toggle1Sink=$(echo "$stream" | cut -f2)
  fi
  if echo "$stream" | grep -q "$TOGGLE2"; then
    toggle2Sink=$(echo "$stream" | cut -f2)
  fi
done < <(pactl list short sinks)

# Set up where to switch to
if [ "$currentSink" = "$toggle1Sink" ]; then
  newSink=$toggle2Sink
else
  newSink=$toggle1Sink
fi

# Switch streams AND default sink
pactl list short sink-inputs|while read -r stream; do
    streamId=$(echo "$stream"|cut '-d ' -f1)
    # exclude echo cancellation module, but switch all other streams
    # You can, but don't have to remove if condition if no such module present
    if [ "$streamId" != "0" ]; then
      echo "moving stream $streamId"
      pactl move-sink-input "$streamId" "$newSink"
    fi;
    # Also switch default sink, so media control keys work correctly
    pactl set-default-sink "$newSink"
done