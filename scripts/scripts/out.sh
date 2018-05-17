#!/bin/zsh
brightness=$(cat /sys/class/backlight/intel_backlight/brightness)
if (($brightness != 0)); then
  echo "Decreased to min value."
  echo 0 > /sys/class/backlight/intel_backlight/brightness
fi
