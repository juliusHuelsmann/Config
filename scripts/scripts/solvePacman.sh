#!/bin/zsh

pathInteractive="/home/juli/.pacError"



function process {
  interactive=$1
  line="${@:2}"

  #echo "debug line = $line; interactive = $interactive"
  if [[ $line =~ "exists in filesystem" ]]; then
    i=0;
    progName=""
    path=""
    for word in $line; do
      if [ $i == 0 ]; then
        progName=$word;
      elif [ $i == 1 ]; then
        path=$word;
      fi
      i=$((i+1))
    done
    if [ $i == 5 ]; then 
      
      owner=$(pacman -Qo $path 2>&1)
      #echo -e "Rename $path for $progName if there is no owner: $owner"
      
      if [[ $owner == "error: No package owns $path" ]]; then

        if [ "$interactive" = true ]; then

          read -p "Are you sure? " -n 1 -r
          if [[ $REPLY =~ ^[Yy]$ ]]; then
            pathNew=$path"Old"
            sudo mv $path $pathNew
            echo "Moved $path to $pathNew"
          else 
            echo "skipped!"
          fi
        else
          echo "$line" >> $pathInteractive
        fi
      else
        echo "Attention: is owned!"
      fi
    else 
      echo -e "[i]\t$line"
    fi
  fi
}



function interactiveMode {


  arr=["first", "second"]
  i=0
  while read -r line; do
    echo $line
    #process true $line 
    arr[i]=$line
    i=$((i+1))
  done < $pathInteractive

#!/bin/bash
file=$pathInteractive
while IFS= read -r line
do
  # display $line or do somthing with $line
  printf '%s\n' "$line"
done <"$file"
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
