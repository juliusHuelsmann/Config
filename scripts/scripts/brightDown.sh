#!/bin/zsh
#
function rbright() {
  brightness=$(cat /sys/class/backlight/intel_backlight/brightness)
  bri=$brightness
  let brightness=$brightness-500
  if (($brightness < 1)); then
    let brightness=1
  fi
  echo "echo $brightness > /sys/class/backlight/intel_backlight/brightness" | zsh
  if (($brightness == 1 &&  $bri != 1)); then
    echo "Decreased to min value."
  fi
}


echo $(rbright)
