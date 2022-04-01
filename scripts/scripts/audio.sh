vol=`pacmd list-sinks|grep -A 15 '* index'| awk '/volume: front/{ print $5 }' | sed 's/[%|,]//g'`
muted=`pacmd list-sinks|grep -A 15 '* index'|awk '/muted:/{ print $2 }'`
echo "Volume: $vol``. Muted: $muted"
