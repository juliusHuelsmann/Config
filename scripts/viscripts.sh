
function bright() {
  let brightness=500
  echo "echo $brightness > /sys/class/backlight/intel_backlight/brightness" | sudo zsh
}

function rbright() {
  brightness=$(cat /sys/class/backlight/intel_backlight/brightness)
  let brightness=$brightness-500
  if (($brightness < 1)); then
    let brightness=1
  fi
  echo "echo $brightness > /sys/class/backlight/intel_backlight/brightness" | sudo zsh
}

function ibright() {
  brightness=$(cat /sys/class/backlight/intel_backlight/brightness)
  max=$(cat /sys/class/backlight/intel_backlight/max_brightness)

  let brightness=$brightness+500
  if (($brightness > $max)); then
    let brightness=$max
  fi
  echo "echo $brightness > /sys/class/backlight/intel_backlight/brightness" | sudo zsh

}
