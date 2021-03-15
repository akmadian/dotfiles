# !/bin/sh
# Automatically kills my statusbar script

kill $(ps -e | grep "status" | awk '{print $1}' | head)

