# Just changes my backlight brightness

BR=$1
if [ "$1" = "max" ]; then
  BR=$(cat /sys/class/backlight/intel_backlight/max_brightness)
fi

sudo echo "$BR" | sudo tee /sys/class/backlight/intel_backlight/brightness > /dev/null
