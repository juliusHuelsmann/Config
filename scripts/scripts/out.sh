#!/bin/zsh
brightness=$(cat /sys/class/backlight/intel_backlight/brightness)
if (($brightness != 1)); then
  echo "Decreased to min value."
  echo 1 > /sys/class/backlight/intel_backlight/brightness
fi
