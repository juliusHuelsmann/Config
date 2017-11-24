
function ibright() {
  brightness=$(cat /sys/class/backlight/intel_backlight/brightness)
  max=$(cat /sys/class/backlight/intel_backlight/max_brightness)

  let brightness=$brightness+500
  if (($brightness > $max)); then
    let brightness=$max
  fi
  echo "echo $brightness > /sys/class/backlight/intel_backlight/brightness" | sudo zsh

}

ibright
