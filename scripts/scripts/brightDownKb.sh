#!/bin/zsh

wd=`dirname "$0"`
min=1
source "$wd/dimcfg"

function rbrightkb() {
  brightPath=/"sys/class/leds/smc::kbd_backlight/brightness"
  brightness=$(cat $brightPath)
  bri=$brightness
  let brightness=$brightness-$atom
  if (($brightness < min)); then
    let brightness=$min
  fi
  echo "echo $brightness > $brightPath" | zsh
  if (($brightness == $min &&  $bri != $min)); then
    echo "Decreased to min value."
  fi
}


echo $(rbrightkb)
