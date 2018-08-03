#!/bin/zsh
wd=`dirname "$0"`
source "$wd/dimcfg"

brightPathMax=/"sys/class/leds/smc::kbd_backlight/max_brightness"
brightPath=/"sys/class/leds/smc::kbd_backlight/brightness"
brightness=$(cat $brightPath)
bri=$brightness
max=$(cat $brightPathMax)

let brightness=$brightness+$atom
if (($brightness > $max)); then
  let brightness=$max
fi

echo "echo $brightness > $brightPath "| zsh

  
if (($brightness == $max && $bri != $max)); then
  echo "increased to max value." 
fi 

