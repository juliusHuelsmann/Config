#!/bin/bash

# dependencies: obviously 
# - ffmpeg, 
# - slop (which wasnt installed)
# 
read -r X Y W H G ID < <(slop -f "%x %y %w %h %g %i")
ffmpeg -f x11grab -r 30 -s "$W"x"$H" -i :0.0+$X,$Y -c:v libx264 -q:v 1 $1
