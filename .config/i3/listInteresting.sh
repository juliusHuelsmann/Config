#!/bin/zsh

echo -e "\nnew execution \n"
files=("Downloads" "Desktop" "~")
req=""
newl="\n"
sep="/"
app="okular "
for i in $files; do
    cd
    cd "$i"
    echo -e "\ni=$i\n"
    cmd=$(ls -t | grep .pdf)
    while IFS= read -r j; do 
      req="$req$app$i$sep$j$newl"
    done <<< "$cmd"
done
$(echo -e "$req" | rofi -dmenu)

