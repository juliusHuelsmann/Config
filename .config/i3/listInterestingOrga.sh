#!/bin/zsh

echo -e "\nnew execution \n"
files=$(find /mnt/data/inter/orga/ -iname '*pdf')

prepend() {
  while read line; do echo "okular $line"; done
}

echo -e " $files" | rofi -dmenu | prepend | zsh

