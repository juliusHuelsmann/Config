#!/bin/bash
set -e

statsDir=$HOME/.stats
stStats=$statsDir/"st.csv"


if [ -e $statsDir ]; then
  echo "exists :)"
else
  mkdir $statsDir
fi

if [ -e $stStats ]; then
  echo "exists :)"
else
  touch $stStats
fi


old=$(tail -n 1 $stStats)
new=$(curl https://api.github.com/repos/juliusHuelsmann/st/releases | grep download_count | awk '{printf $2}' | xargs)

oldArr=(${old//,/ })
newArr=(${new//,/ })

len=${#newArr[@]}
lenB=${#oldArr[@]}
lenC=$(( lenB - 2 ))
sumDiff=0
sumNew=0
if [ $lenC -eq $len ]; then
  for i in $(seq 0 $len); do
    ip=$(( i + 2 ))
    ne=${newArr[i]}
    ol=${oldArr[ip]}
    r=$(( ne - ol ))
    echo " $i  : $r"
    sumDiff=$(( sumDiff + r ))
    sumNew=$(( sumNew + ne ))

  done
  echo "diff: $sumDiff"
  echo "new:  $sumNew"
fi
