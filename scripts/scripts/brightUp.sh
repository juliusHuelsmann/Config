#!/bin/zsh
wd=`dirname "$0"`
source "$wd/dimcfg"

brightness=$(cat /sys/class/backlight/intel_backlight/brightness)
bri=$brightness
max=$(cat /sys/class/backlight/intel_backlight/max_brightness)

let brightness=$brightness+$atom
if (($brightness > $max)); then
  let brightness=$max
fi

echo "echo $brightness > /sys/class/backlight/intel_backlight/brightness" | zsh

  
if (($brightness == $max && $bri != $max)); then
  echo "increased to max value." 
fi 

