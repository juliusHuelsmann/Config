#!/bin/sh

pathInteractive="/home/juli/.pacError"



function process {
  interactive=$1
  line="${@:2}"

  if [[ $line =~ "exists in filesystem" ]]; then
    echo -e "$line"
    i=0;
    progName=""
    path=""
    #setopt shwordsplit
    for word in $line; do
      if [ $i = 0 ]; then
        progName="$word";
      elif [ $i = 1 ]; then
        path="$word";
      fi
      i=$((i+1))
    done
    #unsetopt shwordsplit

    if [ $i = 5 ]; then 
      
      owner=$(/usr/bin/pacman -Qo $path 2>&1)
      #echo -e "Rename $path for $progName if there is no owner: $owner"
      
      if [[ $owner == "error: No package owns $path" ]]; then

        pathNew=$path"Old"
        if [ "$interactive" = true ]; then
          read -p "?Are you sure?" -n 1 -r
          if [[ $REPLY =~ ^[Yy]$ ]]; then
            sudo mv $path $pathNew
            echo "Moved $path to $pathNew"
          else 
            echo "skipped!"
          fi
        else
          sudo mv $path $pathNew
        fi

      else
        echo "Attention: is owned!$owner"
      fi
    else 
      echo -e "[i]\t$line"
    fi
  fi
}



function interactiveMode {
  echo "interactive"

  field=()
  while read -r line; do
    field+=("$line")
  done < $pathInteractive

  amount=${#field[@]}
  echo "read $amount elements"

  for ((x=0; x < $amount; x++)); do
    line="${field[x]}"
    process true $line 
  done

}

function nonInteractiveMode {

  echo -e "" > $pathInteractive
  prefix=$1
  while read line; do
    process false $prefix$line 
    prefix=""
  done 
}

read -p "Launch interactive mode? " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
  interactiveMode 
else 
  nonInteractiveMode $REPLY
fi
