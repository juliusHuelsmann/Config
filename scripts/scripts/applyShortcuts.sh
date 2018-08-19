#!/bin/zsh

# Define input and output files
input="$HOME/scripts/scripts/shortcuts.in"
shellOut=$HOME/.shortcuts
rangerOut=$HOME/.config/ranger/.shortcuts
quteOut=$HOME/.config/qutebrowser/.shortcuts

# process the input file
sed "/^#/d " "$input"  | sed "/^\s*$/d" \
  | tee  \
  >(awk '{print "alias cd"$1"=\"cd "$2" && ls -ltrh\""}' > "$shellOut") \
  >(awk '{print "config.bind(\";"$1"\", \"set downloads.location.directory "$2";; hint links download\")"}' > "$quteOut") \
  | awk '{print "map cd"$1" cd "$2"\nmap t"$1" tab_new "$2"\nmap mv"$1" shell mv -v %s "$2"\nmap Y"$1" shell cp -rv %s "$2"\n"}' > "$rangerOut"

