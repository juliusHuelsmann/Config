#!/bin/bash

# Set next option in list of valid option passed in arguments $2..$#

operation=$1
selected_value=$2
argv=("$@")

amount_values=$#
current_value=$(get.sh $operation)
echo "current_value = $current_value"

for (( j=1; j<$amount_values; j++ )); do
  val="${argv[j]}"
  echo $val
  if [ "$val" == "$current_value" ]; then
    j=$((j+1))
    if [ $j != $amount_values ]; then 
      selected_value="${argv[j]}"
    fi
    break
  fi
done

echo "setting '$selected_value'"
set.sh $operation $selected_value

