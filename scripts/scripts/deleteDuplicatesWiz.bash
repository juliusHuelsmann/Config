#!/bin/bash

function showDialog() {
  declare -a argAry=("${!1}")
  $title=$2
  
  choice=$(dialog --title "Delete duplicates ($(pwd)):" --nocancel \
    --menu "Please select the file you want to keep" 15 185 9 \
    0 "exit, do not remove anything." \
    "${argAry[@]}" \
    3>&1 1>&2 2>&3 3>&1 )
  echo $choice
}



function deleteDuplicatesWizard() {

  toBeChecked=""
  if [ -z "$1" ]; then
    toBeChecked=$(pwd)
  else
    toBeChecked=$1
  fi


    argumentsToDialog=()
    files=("dummyNotPossibleThatItXists")
    state=0
    title=""
    fdupes -r -S "$toBeChecked" | while read x; do
    echo $x
      if [[ state -gt 0 ]]; then
        if [ -n "$x" ]; then
          argumentsToDialog+=($state)
          argumentsToDialog+=("$x")
          files+=("$x")
          state=$((state+1))
        
        else
          echo $argumentsToDialog
          choice=$(showDialog argumentsToDialog[@] $title) #<bash

          if [[ $choice -eq 0 ]]; then
            break
          else
            len=${#files[@]}
            len=$((len-1))
            for fid in $(seq 1 $len); do

              if  [[ $fid -eq $choice ]]; then
                echo "$fid==$choice; choice = ${files[$fid]}"
              else 
                rm "${files[$fid]}"
              fi
            done
          fi

          argumentsToDialog=()
          files=("dummyNotPossibleThatItXists")
          state=0
          title=""
        fi
      else
        title=$x
        state=$((state+1))
      fi
    done
  }

deleteDuplicatesWizard
