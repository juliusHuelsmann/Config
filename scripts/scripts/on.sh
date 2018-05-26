#!/bin/zsh
brightness=$(cat /sys/class/backlight/intel_backlight/brightness)
max=$(cat /sys/class/backlight/intel_backlight/max_brightness)

if (($brightness != $max)); then
  echo "Increased to max value." 
  echo $max > /sys/class/backlight/intel_backlight/brightness 
fi
