#!/bin/zsh
function rbright() {
  brightness=$(cat /sys/class/backlight/intel_backlight/brightness)
  let brightness=$brightness-500
  if (($brightness < 1)); then
    let brightness=1
  fi
  echo "echo $brightness > /sys/class/backlight/intel_backlight/brightness" | sudo zsh
}

rbright
