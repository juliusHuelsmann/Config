#!/bin/zsh

wd=`dirname "$0"`
min=1
source "$wd/dimcfg"

function rbright() {
  brightness=$(cat /sys/class/backlight/intel_backlight/brightness)
  echo $brightness
  bri=$brightness
  let brightness=$brightness-$atom
  if (($brightness < min)); then
    let brightness=$min
  fi
  echo "echo $brightness > /sys/class/backlight/intel_backlight/brightness" | zsh
  if (($brightness == $min &&  $bri != $min)); then
    echo "Decreased to min value."
  fi
}


echo $(rbright)
