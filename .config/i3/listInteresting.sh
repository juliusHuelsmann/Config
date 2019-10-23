#!/bin/zsh

echo -e "\nnew execution \n"
files=("Downloads" "Desktop" "~")
req=""
newl="\n"
sep="/"
app="zathura "
for i in $files; do
    cd
    cd "$i"
    echo -e "\ni=$i\n"
    cmd=$(ls -t | grep .pdf)
    while IFS= read -r j; do 

     
      name="$i$sep$j"
      name=$(printf %q $name)
      name="$name"
      req="$req$app$name$newl"
    done <<< "$cmd"
done
echo "$req"
#$(echo -e "$req" | rofi -dmenu) 2>&1 
#echo $hier
echo -e " $req" | rofi -dmenu | zsh 

