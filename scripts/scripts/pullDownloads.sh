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

termin="record"$(date "+%Y_%m_%d")
terminNum=""$(date "+%s")
terminDetail="record"$(date "+%Y_%m_%d_%H_%M")
count=$(more $stStats | grep $termin | wc -l)

if (( count > 1 )); then
  echo "strange..."
elif [ $count -eq 1 ]; then
  echo "Already recorded :)"
else
  c2=$(curl https://api.github.com/repos/juliusHuelsmann/st/releases | grep download_count | awk '{printf $2}' | xargs)
  echo "Pulling: $c2"
  echo "$terminDetail,$terminNum,$c2" >> $stStats
fi



