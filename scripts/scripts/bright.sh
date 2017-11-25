
function bright() {
  let brightness=500
  echo "echo $brightness > /sys/class/backlight/intel_backlight/brightness" | sudo zsh
}
